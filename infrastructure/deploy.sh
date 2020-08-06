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
    # https://pulsar.apache.org/docs/en/helm-deploy/
    # We can un-comment this when coredns works on all nodes
    # helm install \
    #     --values pulsar/${env}.yaml \
    #     --set nodeSelector.coredns=enabled \
    #     pulsar \
    #     apache/pulsar


    # https://github.com/bitnami/charts/tree/master/bitnami/cassandra/#installing-the-chart
    helm install \
        --namespace iot-prototype \
        --set nodeSelector.coredns=enabled \
        cassandra \
        bitnami/cassandra \
        --values cassandra/${env}.yaml

    helm install jenkins -f cicd/values.yaml bitnami/jenkins --namespace iot-prototype
else 
    # https://pulsar.apache.org/docs/en/helm-deploy/
    # we can uncomment this when coredns works on all nodes
    # helm upgrade \
    #     --values pulsar/${env}.yaml \
    #     pulsar \
    #     apache/pulsar

    # https://github.com/bitnami/charts/tree/master/bitnami/cassandra/#installing-the-chart
    helm upgrade \
        --namespace iot-prototype \
        cassandra \
        bitnami/cassandra \
        --values cassandra/${env}.yaml
fi
kubectl apply -k pulsar/
kubectl apply -k flink/


kubectl apply -k data/



# This is all if you want to access some stuff locally
#   These will let you see whats going on with diferent services in the cluster
    #   kubectl port-forward service/cassandra 9042:9042
    #   kubectl port-forward service/flink-jobmanager 8081:8081
    #   kubectl port-forward service/pulsar-standalone 6650:6650

#   These will let you see the cluster dashboard
    #   kubectl proxy
    #   UI: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
#   To get admin token
    #   kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
# fi