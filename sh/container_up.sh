#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

# Create bind-mount of the log-dir (inside the container)
# into /tmp (on the host) so logs are visible on the host.
readonly APP_LOG_DIR=/app/log
mkdir -p /tmp/${APP_LOG_DIR}

echo "Bring up the new container"
docker run \
  --detach \
  --tmpfs /tmp \
  --name ${APP_CONTAINER} \
  --hostname chennai-${PROJECT_NAME} \
  --mount type=bind,source=/tmp/${APP_LOG_DIR},target=${APP_LOG_DIR} \
  --publish 80:${APP_PORT} \
    ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Crude wait for readyness"
sleep 5
