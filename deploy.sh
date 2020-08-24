#! /bin/sh

set -e
#echo "Begin Job"
#
#JOB_ID=$(flink list | sed -n 3p | cut -c23-54)
#SAVEPOINT=$(flink stop $JOB_ID -p savepoints/refit/inference | sed -n 2p | cut -c33-)
#echo "Start Job \n\t JOB_ID: $JOB_ID\n\t SAVEPOINT: $SAVEPOINT\n\n"
#
#flink run -s $SAVEPOINT inference/target/scala-2.11/inference.jar -d
echo "Build Assemblies"
sbt assembly

echo "Build Integrations"
docker build -t integrations camel
docker tag integrations:latest cdliotprototype/cdl-refit-integrations:latest
docker push cdliotprototype/cdl-refit-integrations:latest

echo "Build Ingestion"
docker build -t ingestion ingestion
docker tag ingestion:latest cdliotprototype/cdl-refit-ingestion:latest
docker push cdliotprototype/cdl-refit-ingestion:latest

