#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Bring up the new container"
docker run \
  --detach \
  --name ${APP_CONTAINER} \
  --hostname chennai-${PROJECT_NAME} \
  --publish ${APP_PORT}:80 \
  --publish 8080:8080 \
    ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Crude wait for readyness"
sleep 5
