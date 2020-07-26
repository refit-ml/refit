#! /bin/sh

set -e

cd ../

# kubectl delete -k data/

echo "=== Proxy ==="


kubectl port-forward service/cassandra 9000:9042 &
kubectl port-forward service/flink-jobmanager 8081:8081 &
kubectl port-forward service/pulsar-standalone 6650:6650 &


echo "=== Listen to output ==="
sleep 10
pulsar-client consume persistent://sample/standalone/ns1/event-log -n 0 -s tst-consumer