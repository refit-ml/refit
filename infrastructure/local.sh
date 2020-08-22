#! /bin/sh
set -e 

ACTION="$1"

cd refit 

helm create refit 

cd ../

# helm install --dry-run --debug --generate-name ./refit


if [ "$ACTION" != "install" ]; then
    ACTION="upgrade"
fi


helm $ACTION refit ./refit -f envs/local/values.yaml