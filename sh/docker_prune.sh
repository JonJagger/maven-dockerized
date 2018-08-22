#!/bin/bash
set -o errexit
set -o xtrace

docker image prune -f
docker container prune -f
docker volume prune -f
