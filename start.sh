#!/bin/sh
set -o errexit

readonly JAR_FILENAME=$1

# - - - - - - - - - - - - - - - - - - - - - - - - - -

if [[ -n $ELK ]]
then
  echo "Setting up elk.training.local in /etc/hosts"
	if ! grep elk.training.local /etc/hosts
	then
		echo "$ELK	elk.training.local" >>/etc/hosts
	else
		sed -i "s/^.*elk\.training\.local.*/$ELK	elk.training.local/" /etc/hosts
	fi
  cat /etc/hosts
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

#if [[ -d /app/netprobe ]]
#then
#  echo "Starting netprobe"
#	export LOG_FILENAME=/app/log/netprobe.log
#	/app/netprobe/netprobe.linux_64 -port 7036 &
#fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

if [[ -d /app/logstash-6.2.4 ]] && grep 'elk\.training\.local' /etc/hosts >/dev/null 2>&1
then
  echo "Starting logstash"
	/app/logstash-6.2.4/bin/logstash -f /app/logstash-6.2.4/conf -l /app/log &
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

echo "Starting the app"
java -jar ${JAR_FILENAME} > /app/log/app.log 2>&1

# - - - - - - - - - - - - - - - - - - - - - - - - - -

echo "Keep container alive"
echo "........"
while :
do
  echo "."
	sleep 60
done
