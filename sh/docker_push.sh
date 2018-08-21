#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Push the image to the repository"
# OFF because it keeps falling over
# docker push \
#  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

# You can also docker save/load instead of using the registry.
docker save ${APP_IMAGE} | gzip > ${MY_DIR}/${APP_IMAGE}.tar.gz