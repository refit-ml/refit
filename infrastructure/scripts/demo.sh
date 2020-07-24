#! /bin/sh

set -e

cd ../

# kubectl delete -k data/

echo "=== Wait for things to term ==="
sleep 10

kubectl apply -k data/

echo "=== Wait for our bits to start up ==="

sleep 30

echo "=== Open ports 9042, 6650 ==="
kubectl port-forward service/cassandra 9042:9042 &
kubectl port-forward service/pulsar-standalone 6650:6650 &

echo "=== Listen to output ==="
sleep 10
pulsar-client consume persistent://public/standalone/default/event-log -n 0 -s tst-consumer