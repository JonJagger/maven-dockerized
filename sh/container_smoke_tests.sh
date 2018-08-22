#!/bin/bash
set -o errexit

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

# - - - - - - - - - - - - - -

curl_route()
{
  IP='127.0.0.1'
  ROUTE=$1
  URL="http://${IP}:${APP_PORT}${ROUTE}"
  if curl --fail --verbose "http://${IP}:${APP_PORT}${ROUTE}"
  then
    echo "PASS ${status} ${URL}"
  else
    echo "FAIL ${status} ${URL}"
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
