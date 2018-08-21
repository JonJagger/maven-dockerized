#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

docker rm -f $(docker ps -a | tail -n +2 | awk '{print $1}')
