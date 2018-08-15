#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Tag the image"
docker tag \
  ${APP_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
