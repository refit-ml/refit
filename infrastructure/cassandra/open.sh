#! /bin/sh

export CASSANDRA_PASSWORD=$(kubectl get secret --namespace iot-prototype cassandra -o jsonpath="{.data.cassandra-password}" | base64 --decode)

kubectl run --namespace iot-prototype cassandra-client --rm --tty -i --restart='Never' \
   --env CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
    \
   --image docker.io/bitnami/cassandra:3.11.6-debian-10-r138 -- bash

# cqlsh -u cassandra -p $CASSANDRA_PASSWORD cassandra