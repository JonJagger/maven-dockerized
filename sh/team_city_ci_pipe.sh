#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

# - - - - - - - - - - - - - - - - - - - - - -

bring_down_container()
{
  docker ps -a
  docker rm --force ${APP_CONTAINER} &> /dev/null || true
}

# - - - - - - - - - - - - - - - - - - - - - -

echo "Build an image from the jar"
docker build \
  --tag ${APP_IMAGE} \
    ${MY_DIR}/..

echo "Bring down the current web-server if it exists"
bring_down_container

echo "Bring up the new web-server"
docker run \
  --detach \
  --name ${APP_CONTAINER} \
  --publish ${APP_PORT}:8080 \
    ${APP_IMAGE}

echo "Crude wait for readyness"
sleep 1

echo "Run basic smoke-test"
readonly CURL_LOG="/tmp/curl-${APP_PORT}.log"
curl --version
if curl -i -X GET "http://localhost:${APP_PORT}/" &> ${CURL_LOG} ; then
  echo "Route / is 200"
else
  status=$?
  echo "Route / is poorly (${status})"
  cat ${CURL_LOG}
  bring_down_container
  #exit ${status}
fi

echo "Tag the image"
docker tag \
  ${APP_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Push the image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

echo "Bring down the web-server"
docker rm --force ${APP_CONTAINER} &> /dev/null || true

echo "Remove the local images"
docker rmi ${APP_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${APP_IMAGE}

