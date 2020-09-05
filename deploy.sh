#! /bin/sh

set -e
#echo "Begin Job"
#
#JOB_ID=$(flink list | sed -n 3p | cut -c23-54)
#SAVEPOINT=$(flink stop $JOB_ID -p savepoints/refit/inference | sed -n 2p | cut -c33-)
#echo "Start Job \n\t JOB_ID: $JOB_ID\n\t SAVEPOINT: $SAVEPOINT\n\n"
#
#flink run -s $SAVEPOINT inference/target/scala-2.11/inference.jar -d
tag="ALPHA-10"

echo "Build Assemblies"
sbt assembly

echo "Build Integrations"
docker build -t integrations integrations
docker tag integrations:latest cdliotprototype/cdl-refit-integrations:latest
docker push cdliotprototype/cdl-refit-integrations:latest
docker tag integrations:latest cdliotprototype/cdl-refit-integrations:$tag
docker push cdliotprototype/cdl-refit-integrations:$tag


echo "Build Ingestion"
docker build -t ingestion ingestion
docker tag ingestion:latest cdliotprototype/cdl-refit-ingestion:latest
docker push cdliotprototype/cdl-refit-ingestion:latest

docker tag ingestion:latest cdliotprototype/cdl-refit-ingestion:$tag
docker push cdliotprototype/cdl-refit-ingestion:$tag


echo "Build inference"
docker build -t inference inference
docker tag inference:latest cdliotprototype/cdl-refit-inference:latest
docker push cdliotprototype/cdl-refit-inference:latest

docker tag inference:latest cdliotprototype/cdl-refit-inference:$tag
docker push cdliotprototype/cdl-refit-inference:$tag

echo "Build Cassandra"
docker build -t cassandra db/src/main/cql/
docker tag cassandra:latest cdliotprototype/cdl-refit-cassandra:latest
docker push cdliotprototype/cdl-refit-cassandra:latest

docker tag cassandra:latest cdliotprototype/cdl-refit-cassandra:$tag
docker push cdliotprototype/cdl-refit-cassandra:$tag
