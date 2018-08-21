#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Bring down the current web-server"
docker rm --force ${APP_CONTAINER} || true
