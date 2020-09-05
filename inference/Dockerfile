FROM flink:1.10-scala_2.11

COPY ./target/scala-2.11/inference.jar /app/inference.jar

RUN apt-get update

RUN apt-get install wait-for-it -y

CMD wait-for-it ${PULSAR_HOST}:6650 -t 300 -s -- wait-for-it ${FLINK_HOST}:8081 -t 300 -s -- flink run -d -m ${FLINK_HOST}:8081 /app/inference.jar
