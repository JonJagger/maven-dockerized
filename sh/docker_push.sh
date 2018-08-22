#!/bin/bash
set -o errexit
set -o xtrace

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

# - - - - - - - - - - - - - - - - - - - - - - - -

if [[ "${USE_REGISTRY}" == "true" ]]
then
  echo "Doing a real docker push to the registry"
  docker push ${DOCKER_REGISTRY_URL}/${APP_IMAGE}
fi

# - - - - - - - - - - - - - - - - - - - - - - - -

if [[ "${USE_REGISTRY}" == "false" ]]
then
  echo "Doing a fake docker push to the registry"
  # TeamCity build step #2 copies everything
  # in sh/ to the deployment machine.
  docker save ${DOCKER_REGISTRY_URL}/${APP_IMAGE} \
    | gzip > ${MY_DIR}/${APP_IMAGE}.tar.gz
fi

# - - - - - - - - - - - - - - - - - - - - - - - -
