#! /bin/sh
set -e 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add apache https://pulsar.apache.org/charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm repo update

cd refit 

helm create refit 

cd ../

helm install --dry-run --debug --generate-name ./refit

helm install refit ./refit --namespace iot-prototype -f envs/local/values.yaml