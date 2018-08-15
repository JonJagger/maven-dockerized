#!/bin/bash

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker run --detach \
  --name ${APP_CONTAINER} \
  --publish ${APP_PORT}:8080 \
    ${APP_IMAGE}
