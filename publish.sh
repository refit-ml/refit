#! /bin/sh

set -e
tag="ALPHA-17"

echo "Build Assemblies"
sbt db/assembly

echo "Build DB"
docker build -t db db
docker tag db:latest cdliotprototype/cdl-refit-db:latest
docker push cdliotprototype/cdl-refit-db:latest

docker tag db:latest cdliotprototype/cdl-refit-db:$tag
docker push cdliotprototype/cdl-refit-db:$tag


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
