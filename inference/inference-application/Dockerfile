FROM cdliotprototype/cdl-refit-flink:BETA-1.0

COPY ./target/scala-2.12/inference.jar /app/inference.jar
ADD ./src/main/python /app

WORKDIR /app

RUN apt-get dist-upgrade  -y
RUN apt-get update

RUN apt-get install python3 python3-pip wait-for-it -y

RUN pip3 install -r requirements.txt

CMD wait-for-it ${KAFKA_HOST} -t 300 -s -- wait-for-it ${WAIT_FLINK_HOST}:8081 -t 300 -s -- python3 /app/deploy.py
