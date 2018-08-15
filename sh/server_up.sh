#!/bin/sh
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

echo "Bring up the web server"
java -jar ${MY_DIR}/${JAR_FILENAME}
