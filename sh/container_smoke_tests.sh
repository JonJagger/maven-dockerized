#!/bin/bash
set -o errexit

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh
readonly CURL_LOG="/tmp/curl-${APP_PORT}.log"

# - - - - - - - - - - - - - -

curl_route()
{
  IP='localhost'
  ROUTE=$1
  URL="http://${IP}:${APP_PORT}${ROUTE}"
  if curl --fail --verbose "${URL}" &> ${CURL_LOG}
  then
    echo "PASS ${URL}"
  else
    echo "FAIL ${URL}"
    cat ${CURL_LOG}
    docker ps -a
    exit 22
  fi
}

# - - - - - - - - - - - - - -

cat /etc/hosts || true

echo "Run basic smoke-tests"
curl_route '/'
curl_route '/page1.html'
curl_route '/page2.html'
curl_route '/page3.html'
