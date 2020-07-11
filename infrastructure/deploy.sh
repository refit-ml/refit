#!/bin/sh

env="local"
action="update"

kubectl apply -k org/ 

chmod +x ./scripts/*

if [ "$action" == "install" ]; then
    . ./scripts/install.sh
else 
    . ./scripts/update.sh
fi

kubectl apply -k flink/ 
kubectl apply -k pulsar/  

# kubectl proxy
# flink - http://localhost:8001/api/v1/namespaces/iot-prototype/services/flink-jobmanager:8081/proxy/
# pulsar manager - http://localhost:8001/api/v1/namespaces/iot-prototype/services/pulsar-pulsar-manager:9527/proxy/
# pulsar grafana - http://localhost:8001/api/v1/namespaces/iot-prototype/services/pulsar-grafana:3000/proxy/


# cassandra http://localhost:8001/api/v1/namespaces/iot-prototype/services/cassandra:9042/proxy/
# gocd http://localhost:8001/api/v1/namespaces/iot-prototype/services/gocd-server:8153/proxy/