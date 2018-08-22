#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Remove the local image"
if ! docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
then
  echo "no previous image to remove"
fi

echo "Remove cached images"
if ! docker rmi $(docker images | tail -n +2 | awk '{print $3}')
then
  echo "no cached images to remove"
fi
