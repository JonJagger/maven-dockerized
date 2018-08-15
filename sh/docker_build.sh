#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Build an image from the jar"
docker build \
  --build-arg JAR_FILENAME=${JAR_FILENAME} \
  --tag ${DOCKER_REGISTRY_URL}/${APP_IMAGE} \
    ${MY_DIR}/..
