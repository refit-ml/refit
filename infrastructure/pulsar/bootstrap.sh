#!/bin/sh

# Instructions from http://pulsar.apache.org/docs/en/kubernetes-helm/

helm repo add apache https://pulsar.apache.org/charts

helm repo update

git clone https://github.com/apache/pulsar-helm-chart

cd pulsar-helm-chart


./scripts/pulsar/prepare_helm_release.sh \
    -n iot-prototype \
    -k pulsar-mini \
    -c

helm install \
    --values examples/values-minikube.yaml \
    pulsar-mini apache/pulsar



