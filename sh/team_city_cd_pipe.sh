#!/bin/bash
set -o errexit
set -o xtrace

# This script and all sh/ files are SCP'd onto
# the deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

${MY_DIR}/container_rm.sh
${MY_DIR}/docker_rmi.sh
${MY_DIR}/docker_prune.sh
${MY_DIR}/docker_pull.sh
${MY_DIR}/container_up.sh
${MY_DIR}/container_logs.sh
#${MY_DIR}/container_smoke_tests.sh

docker ps -a
