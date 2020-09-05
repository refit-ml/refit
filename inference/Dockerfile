FROM flink:1.10.1-scala_2.11

RUN apt-get update
RUN apt-get install wait-for-it -y
RUN apt-get install python3 python3-pip -y
RUN pip3 install --upgrade pip setuptools

COPY ./target/scala-2.11/inference.jar /app/inference.jar
COPY ./src/main/python/deploy.py /app/deploy.py
COPY ./src/main/python/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

CMD wait-for-it ${PULSAR_HOST}:6650 -t 300 -s -- wait-for-it ${FLINK_HOST}:8081 -t 300 -s -- python3 /app/deploy.py
