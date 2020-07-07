#!/bin/sh

kubectl apply -k org/  

cd pulsar

chmod +x ./bootstrap.sh

# ./bootstrap.sh

cd ../

kubectl apply -k cassandra/  
kubectl apply -k flink/  

# kubectl proxy
# flink - http://localhost:8001/api/v1/namespaces/iot-flink/services/flink-jobmanager:ui/proxy/#/overview