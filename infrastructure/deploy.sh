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
    helm install cassandra -f cassandra/values.yaml bitnami/cassandra --namespace iot-prototype \
        --set nodeSelector.coredns=enabled \
        
    helm install jenkins -f cicd/values.yaml stable/jenkins --namespace iot-prototype
    helm install grafana -f grafana/values.yaml stable/grafana --namespace iot-prototype
    helm install redis -f redis/values.yaml --namespace iot-prototype bitnami/redis
else
    helm upgrade cassandra -f cassandra/values.yaml bitnami/cassandra --namespace iot-prototype
    helm upgrade jenkins -f cicd/values.yaml bitnami/jenkins --namespace iot-prototype
    helm upgrade grafana -f grafana/values.yaml stable/grafana --namespace iot-prototype
    helm upgrade redis -f redis/values.yaml --namespace iot-prototype bitnami/redis
fi
kubectl apply -k pulsar/
kubectl apply -k flink/


kubectl apply -k data/



# kubectl port-forward service/cassandra 9000:9042 9160:9160 &
# kubectl port-forward service/flink-jobmanager 8081:8081 &
# kubectl port-forward service/pulsar-standalone 6650:6650 &
# kubectl port-forward service/jenkins 8000:80
# k port-forward service/redis-master 6379:6379


#   These will let you see the cluster dashboard
    #   kubectl proxy
    #   UI: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
#   To get admin token
    #   kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
# fi