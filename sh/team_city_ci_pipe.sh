#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Build an image from the jar"
docker build \
  --tag ${APP_IMAGE} \
    ${MY_DIR}/..

echo "Tag the image"
docker tag \
  ${APP_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Push the image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Remove the local images"
docker rmi ${APP_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

