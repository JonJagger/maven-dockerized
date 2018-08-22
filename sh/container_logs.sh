#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Display the web-server logs"
docker logs ${APP_CONTAINER}
