#!/bin/sh
ACTION="$1"

set -e 

#helm repo add bitnami https://charts.bitnami.com/bitnami
#helm repo add apache https://pulsar.apache.org/charts
#helm repo add stable https://kubernetes-charts.storage.googleapis.com

#helm repo update

cd refit 

helm create refit 

cd ../


if [ "$ACTION" != "install" ]; then
    ACTION="upgrade"
fi

helm $ACTION refit --namespace iot-prototype --dry-run --debug ./refit

helm $ACTION refit ./refit --namespace iot-prototype -f envs/tiger/values.yaml
