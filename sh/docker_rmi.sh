#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Remove the local image"
docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Remove cached images"

#docker rmi $(docker images | tail -n +2 | awk '{print $3}')

#This fails with
#Error response from daemon: conflict: unable to delete 628fa1bffa5f (must be forced) - image is referenced in multiple repositories

