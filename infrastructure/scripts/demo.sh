#! /bin/sh

set -e

cd ../

# kubectl delete -k data/

echo "=== Proxy ==="


kubectl port-forward service/cassandra 9000:9042 &
kubectl port-forward service/flink-jobmanager 8081:8081 &
kubectl port-forward service/pulsar-standalone 6650:6650 &

sleep 10
echo "=== Listen to output ==="

pulsar-client consume persistent://sample/standalone/ns1/event-log -n 0 -s tst-consumer


# Interesting model ( > 70 degrees) abed1e0f-c525-45ff-a81b-84cc734ba171
    # data -- ACTION=model MODEL_VERSION=abed1e0f-c525-45ff-a81b-84cc734ba171 sbt run
# Random model (:shrug)  67bb6c55-9d0f-457c-8d8a-67f33de78eba
    # data -- ACTION=model MODEL_VERSION=a67bb6c55-9d0f-457c-8d8a-67f33de78eba sbt run
# 