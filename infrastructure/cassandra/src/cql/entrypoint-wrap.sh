#!/bin/bash

# Create default keyspace for single node cluster
until cqlsh -f /cql/schema.cql; do
  echo "cqlsh: Cassandra is unavailable - retry later"
  sleep 2
done &

exec /docker-entrypoint.sh "$@"