#!/bin/sh
set -o errexit

readonly JAR_FILENAME=$1

echo "Starting the app"
java -jar ${JAR_FILENAME}

echo "Keep container alive"
while :
do
	sleep 60
done
