#!/bin/sh

env="$1"
action="$2"

# if [ "$env" == "local" ]; then 
#     minikube start --cpus 10 --memory 10000
#     kubectl label nodes minikube coredns=enabled
#     kubectl config set-context --current --namespace=iot-prototype 
# fi

kubectl apply -k org/ 




