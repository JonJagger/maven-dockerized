#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Bring down the current web-server"
docker rm --force ${APP_CONTAINER} || true

#docker rm -f $(docker ps -a | tail -n +2 | awk '{print $1}')
