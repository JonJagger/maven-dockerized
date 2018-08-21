#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Pull the image from the repository"
# OFF because it keeps falling over
docker pull ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

# You can also docker save/load instead of using the registry.
#docker load < ${MY_DIR}/${APP_IMAGE}.tar.gz