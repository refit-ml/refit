FROM openjdk:8

COPY ./target/scala-2.11/ingestion.jar /app/ingestion.jar

RUN apt-get update

RUN apt-get install wait-for-it -y

CMD wait-for-it ${PULSAR_HOST}:6650 -t 300 -s -- wait-for-it ${CASSANDRA_HOST}:9042 -t 300 -s -- java -jar app/camel.jar
