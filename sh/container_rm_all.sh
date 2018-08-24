#!/bin/bash
set -o errexit
set -o xtrace

# This only runs on the deployment machine.
# Removes all running containers, which means it
# should work if the project name is changed.

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Bring down all containers"
if ! docker rm -f $(docker ps -a | tail -n +2 | awk '{print $1}')
then
  echo "No container to bring down"
fi
