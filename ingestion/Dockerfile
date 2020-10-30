FROM openjdk:8

COPY ./target/scala-2.12/ingestion.jar /app/ingestion.jar

RUN apt-get update

RUN apt-get install wait-for-it -y

CMD wait-for-it ${KAFKA_HOST} -t 300 -s -- wait-for-it ${WAIT_CASSANDRA_HOST}:9042 -t 300 -s -- java -jar app/ingestion.jar
