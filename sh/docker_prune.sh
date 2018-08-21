#!/bin/bash
set -ex

docker image prune -f
docker container prune -f
docker volume prune -f
