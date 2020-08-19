#! /bin/sh

set -e
echo "Begin Job"

JOB_ID=$(flink list | sed -n 3p | cut -c23-54)
SAVEPOINT=$(flink stop $JOB_ID -p savepoints/refit/inference | sed -n 2p | cut -c33-)
echo "Start Job \n\t JOB_ID: $JOB_ID\n\t SAVEPOINT: $SAVEPOINT\n\n"

flink run -s $SAVEPOINT inference/target/scala-2.11/inference.jar -d
