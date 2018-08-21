#!/bin/bash
# OFF set -o errexit

readonly JAR_FILENAME=$1

echo "Starting the app"
echo "JAR_FILENAME=${JAR_FILENAME}"
java -jar ${JAR_FILENAME}
