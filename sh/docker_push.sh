#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Push the image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
