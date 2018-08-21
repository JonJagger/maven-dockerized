#!/bin/bash
set -ex

# This script and all sh/ files are SCP'd onto
# the deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

${MY_DIR}/docker_prune.sh
${MY_DIR}/docker_pull.sh
${MY_DIR}/container_down.sh
${MY_DIR}/container_up.sh
${MY_DIR}/container_logs.sh
${MY_DIR}/container_ci_smoke_tests.sh
