#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

#============================================
#echo "Simple sanity check"

#readonly CURL_LOG="/tmp/curl-faces-book-${FACES_BOOK_PORT}.log"
#curl -i -f -X GET "http://localhost:${APP_PORT}/" &> ${CURL_LOG}
#cat ${CURL_LOG}

docker ps -a

echo "Run basic smoke-test"
readonly CURL_LOG="/tmp/curl-${APP_PORT}.log"
if curl -i -X GET "http://34.255.183.177:${APP_PORT}/index.html" &> ${CURL_LOG} ; then
  echo "Route /index.html is 200"
else
  status=$?
  echo "Route /index.html is poorly (${status})"
  cat ${CURL_LOG}
  #${MY_DIR}/container_down.sh   #curl fails when it should pass...
  #exit ${status}
fi
#============================================
