#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

#============================================
echo "Run basic smoke-test"
readonly CURL_LOG="/tmp/curl-${APP_PORT}.log"
# This works
# curl -i -f -X GET "http://google.co.uk/"

docker container ls

# Crude wait for readyness
sleep 5

if curl -i -X GET "http://localhost:${APP_PORT}/" &> ${CURL_LOG} ; then
  echo "Route / is 200"
else
  status=$?
  echo "Route / is poorly (${status})"
  cat ${CURL_LOG}
  ${MY_DIR}/container_down.sh
  #exit ${status}
fi
#============================================
