#!/bin/bash

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker build \
  --build-arg APP_PORT=$APP_PORT} \
  --tag ${APP_IMAGE} \
    ${MY_DIR}/..
