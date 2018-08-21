#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

${MY_DIR}/docker_prune.sh
${MY_DIR}/docker_build.sh
${MY_DIR}/container_rm.sh
${MY_DIR}/container_up.sh
${MY_DIR}/container_logs.sh
#${MY_DIR}/container_smoke_tests.sh
${MY_DIR}/container_rm.sh
${MY_DIR}/docker_push.sh
${MY_DIR}/docker_rmi.sh

echo "Show the log on the host"
readonly APP_LOG_DIR=/app/log
cat /tmp/${APP_LOG_DIR}/app.log
