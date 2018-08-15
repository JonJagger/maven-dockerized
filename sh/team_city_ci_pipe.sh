#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

${MY_DIR}/docker_build.sh
${MY_DIR}/docker_tag.sh
${MY_DIR}/container_down.sh
${MY_DIR}/container_up.sh
${MY_DIR}/container_ci_smoke_tests.sh
${MY_DIR}/docker_push.sh
${MY_DIR}/container_down.sh

echo "Remove the local images"
docker rmi ${APP_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

