#!/bin/sh

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add apache https://pulsar.apache.org/charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm repo update

# https://pulsar.apache.org/docs/en/helm-deploy/
helm install \
    --values pulsar/${env}.yaml \
    pulsar \
    apache/pulsar

# https://github.com/bitnami/charts/tree/master/bitnami/cassandra/#installing-the-chart
helm install \
    --namespace iot-prototype \
     cassandra \
     bitnami/cassandra \
    --values cassandra/${env}.yaml

# helm install \
#     --namespace iot-prototype \
#     gocd \
#     stable/gocd