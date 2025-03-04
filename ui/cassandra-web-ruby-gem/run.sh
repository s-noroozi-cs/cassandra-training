#!/bin/bash
set -eu

#HOST IPs
if [[ ! -v CASSANDRA_HOST_IPS ]]; then
  CASSANDRA_HOST_IPS="127.0.0.1"
else
  CASSANDRA_HOST_IPS="${CASSANDRA_HOST_IPS}"
fi

#PORT
if [[ ! -v CASSANDRA_PORT ]]; then
  CASSANDRA_PORT="9042"
else
  CASSANDRA_PORT="${CASSANDRA_PORT}"
fi

#USERNAME
if [[ ! -v CASSANDRA_USERNAME ]]; then
  CASSANDRA_USERNAME="cassandra"
else
  CASSANDRA_USERNAME="${CASSANDRA_USERNAME}"
fi

#PASSWORD
if [[ ! -v CASSANDRA_PASSWORD ]]; then
  CASSANDRA_PASSWORD="cassandra"
else
  CASSANDRA_PASSWORD="${CASSANDRA_PASSWORD}"
fi

#Cannot resolve hostname
# github issue
# https://github.com/avalanche123/cassandra-web/issues/19
CASSANDRA_HOST_IPS=$(nslookup ${CASSANDRA_HOST_IPS} 2>/dev/null |  grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -n1)


COMMAND="cassandra-web --hosts $CASSANDRA_HOST_IPS --port $CASSANDRA_PORT --username $CASSANDRA_USERNAME --password $CASSANDRA_PASSWORD"

echo $COMMAND

exec $COMMAND
