#!/bin/sh


# https://pulsar.apache.org/docs/en/helm-deploy/
helm upgrade \
    --values pulsar/${env}.yaml \
    pulsar \
    apache/pulsar

# https://github.com/bitnami/charts/tree/master/bitnami/cassandra/#installing-the-chart
helm upgrade \
    --namespace iot-prototype \
     cassandra \
     bitnami/cassandra \
    --values cassandra/${env}.yaml


helm upgrade \
    --namespace iot-prototype \
    gocd \
    stable/gocd