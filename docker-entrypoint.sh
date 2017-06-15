#!/bin/bash
set -ex

if [[ -z "$KAFKA_BROKER_ID" ]]; then
  export KAFKA_BROKER_ID="-1"
fi

if [[ -z "$KAFKA_LOG_DIRS" ]]; then
  if [[ $KAFKA_BROKER_ID -gt 0 ]]; then
    export KAFKA_LOG_DIRS="/kafka/kafka-logs-$KAFKA_BROKER_ID"
  else
    export KAFKA_LOG_DIRS="/kafka/kafka-logs-$HOSTNAME"
  fi
fi

exec consul-template -template "$KAFKA_HOME/config/server.properties.ctmpl:$KAFKA_HOME/config/server.properties" -exec "$*"
