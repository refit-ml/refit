#!/bin/sh

env="$1"
action="$2"

if [ "$env" == "local" ]; then 
    minikube start --cpus 10 --memory 10000
fi

kubectl apply -k org/ 
kubectl apply -k cicd/

chmod +x ./scripts/*

if [ "$action" == "install" ]; then
    . ./scripts/install.sh
else 
    . ./scripts/update.sh
fi

kubectl apply -k flink/

if [ "$env" == "local" && "$action" == "install" ]; then
    minikube service gocd-server -n iot-prototype
    minikube service flink-jobmanager -n iot-prototype
    minikube service pulsar-pulsar-manager -n iot-prototype
fi

# kubectl proxy
# flink - http://localhost:8001/api/v1/namespaces/iot-prototype/services/flink-jobmanager:8081/proxy/
# pulsar manager - http://localhost:8001/api/v1/namespaces/iot-prototype/services/pulsar-pulsar-manager:9527/proxy/
# pulsar grafana - http://localhost:8001/api/v1/namespaces/iot-prototype/services/pulsar-grafana:3000/proxy/


# cassandra http://localhost:8001/api/v1/namespaces/iot-prototype/services/cassandra:9042/proxy/
# gocd http://localhost:8001/api/v1/namespaces/iot-prototype/services/gocd-server:8153/proxy/

