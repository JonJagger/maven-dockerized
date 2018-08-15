#!/bin/bash
set -ex

# This script (along with .env) are SCP'd onto
# the deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Pull the image from the repository"
docker pull ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Bring down the current web-server"
docker rm --force ${APP_CONTAINER} &> /dev/null || true

echo "Bring up the new web-server"
docker run \
  --detach \
  --name ${APP_CONTAINER} \
  --publish ${APP_PORT}:8080 \
    ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Crude wait for readyness"
sleep 2

echo "Display the web-server logs"
docker logs ${APP_CONTAINER}

echo "Simple sanity check"
#readonly CURL_LOG="/tmp/curl-faces-book-${FACES_BOOK_PORT}.log"
#curl -i -f -X GET "http://localhost:${FACES_BOOK_PORT}/" &> ${CURL_LOG}
#cat ${CURL_LOG}
