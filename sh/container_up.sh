#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Bring up the new web-server"
docker run \
  --detach \
  --name ${APP_CONTAINER} \
  --publish ${APP_PORT}:8080 \
    ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Crude wait for readyness"
sleep 2
