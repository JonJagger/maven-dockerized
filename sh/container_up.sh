#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

# Create bind-mount of the log-dir inside the container
# into /tmp on the host so I can see the logs on the host.
readonly APP_LOG_DIR=/app/log
mkdir -p /tmp/${APP_LOG_DIR}

echo "Bring up the new container"
docker run \
  --detach \
  --name ${APP_CONTAINER} \
  --mount type=bind,source=/tmp/${APP_LOG_DIR},target=${APP_LOG_DIR} \
  --publish ${APP_PORT}:80 \
    ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Crude wait for readyness"
sleep 5
