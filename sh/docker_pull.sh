#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Pull the image from the repository"
docker pull ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
