#! /bin/sh

set -e
echo "Begin Job"

JOB_ID=$(flink -m flink-jobmanager:6123 list | sed -n 3p | cut -c23-54)
SAVEPOINT=$(flink -m flink-jobmanager:6123 savepoint $JOB_ID savepoints/refit/inference | sed -n 3p | cut -c33-)

echo "Start Job \n\t JOB_ID: $JOB_ID\n\t SAVEPOINT: $SAVEPOINT"

flink stop -m flink-jobmanager:6123 $JOB_ID

flink run -m flink-jobmanager:6123 -d -s $SAVEPOINT inference/target/scala-2.11/inference.jar