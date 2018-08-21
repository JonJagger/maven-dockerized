#!/bin/bash
set -x

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh
readonly CURL_LOG="/tmp/curl-${APP_PORT}.log"

# - - - - - - - - - - - - - -

curl_route()
{
  IP='localhost'
  ROUTE=$1
  URL="http://${IP}:${APP_PORT}${ROUTE}"
  #echo "cURLing... http://${IP}:${APP_PORT}${ROUTE}"
  if curl --fail -X GET "http://${IP}:${APP_PORT}${ROUTE}" &> ${CURL_LOG};
  then
    echo "PASS ${status} ${ROUTE}"
  else
    echo "FAIL ${status} ${ROUTE}"
    cat ${CURL_LOG}
    exit 22
  fi
}

# - - - - - - - - - - - - - -

echo "Run basic smoke-test"
# Crude wait for readyness
sleep 5

curl_route '/'
curl_route '/page1.html'
curl_route '/page2.html'
curl_route '/page3.html'
curl_route '/XXXX.html'
