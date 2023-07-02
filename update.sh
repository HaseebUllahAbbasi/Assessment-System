#!/bin/bash


ARG1=$1
ARG2=$2

set -u ## exit if you try to use an uninitialised variable
set -e ## exit if any statement fails


PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
getIpAddress() {
    hostname -I | head -n1 | awk '{print $1;}'
}
ip=`getIpAddress`

# update submodule 
git submodule update --init --recursive
git submodule foreach --recursive git checkout development
git submodule foreach --recursive git pull