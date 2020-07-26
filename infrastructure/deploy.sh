#!/bin/sh

env="$1"
action="$2"

if [ "$env" == "local" ]; then 
    minikube start --cpus 10 --memory 10000
    kubectl label nodes minikube coredns=enabled
    kubectl config set-context --current --namespace=iot-prototype 
fi

kubectl apply -k org/ 


chmod +x ./scripts/*

if [ "$action" == "install" ]; then
    . ./scripts/install.sh
else 
    . ./scripts/update.sh
fi
kubectl apply -k pulsar/
kubectl apply -k flink/


# kubectl apply -k training/
# kubectl apply -k data/




# if [ true == false ]; then 
#     kubectl port-forward service/cassandra 9042:9042
#     kubectl port-forward service/flink-jobmanager 8081:8081
#     kubectl port-forward service/pulsar-standalone 6650:6650
#     # To get admin token
#     # kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
# fi