#! /bin/sh
set -e 

cd refit 

helm create refit 

cd ../

helm install --dry-run --debug --generate-name ./refit

helm install refit ./refit --namespace iot-prototype -f envs/local/values.yaml