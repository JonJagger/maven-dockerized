#!/bin/bash
set -x

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

# - - - - - - - - - - - - - -

curl_route()
{
  IP='localhost'
  ROUTE=$1
  CURL_LOG="/tmp/curl-${APP_PORT}.log"

  echo "cURLing... http://${IP}:${APP_PORT}${ROUTE}"
  curl -i -f -X GET "http://${IP}:${APP_PORT}${ROUTE}" &> ${CURL_LOG}
  status=$?
  if [ "${status}" -eq "0" ]; then
    echo "PASS ${status} ${ROUTE}"
  else
    echo "FAIL ${status} ${ROUTE}"
    cat ${CURL_LOG}
  fi
}

# - - - - - - - - - - - - - -

echo "Run basic smoke-test"
# Crude wait for readyness
sleep 5

curl_route '/'
curl_route '/page1.html'
