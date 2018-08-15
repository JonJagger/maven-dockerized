#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Build an image from the jar"
docker build \
  --tag ${APP_IMAGE} \
    ${MY_DIR}/..
