#!/bin/sh

env="$1"
action="$2"

if [ "$env" == "local" ]; then 
    minikube start --cpus 10 --memory 10000
    kubectl label nodes minikube coredns=enabled
    kubectl config set-context --current --namespace=iot-prototype 
fi

kubectl apply -k org/ 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add apache https://pulsar.apache.org/charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm repo update

if [ "$action" == "install" ]; then

    # https://github.com/bitnami/charts/tree/master/bitnami/cassandra/#installing-the-chart
    helm install \
        --namespace iot-prototype \
        --set nodeSelector.coredns=enabled \
        cassandra \
        bitnami/cassandra \
        --values cassandra/values.yaml

    helm install jenkins -f cicd/values.yaml stable/jenkins --namespace iot-prototype
    helm install grafana -f grafana/values.yaml stable/grafana --namespace iot-prototype
else
    helm upgrade \
        --namespace iot-prototype \
        cassandra \
        bitnami/cassandra \
        --values cassandra/values.yaml

    helm upgrade jenkins -f cicd/values.yaml bitnami/jenkins --namespace iot-prototype
    helm upgrade grafana -f grafana/values.yaml stable/grafana --namespace iot-prototype
fi
kubectl apply -k pulsar/
kubectl apply -k flink/


kubectl apply -k data/


#   These will let you see the cluster dashboard
    #   kubectl proxy
    #   UI: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
#   To get admin token
    #   kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
# fi