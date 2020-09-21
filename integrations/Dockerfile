FROM openjdk:8

COPY ./target/scala-2.11/integrations.jar /app/integrations.jar

RUN apt-get update

RUN apt-get install wait-for-it -y

CMD wait-for-it ${WAIT_PULSAR_HOST}:6650 -t 300 -s -- wait-for-it ${WAIT_CASSANDRA_HOST}:9042 -t 300 -s -- java -jar app/integrations.jar
