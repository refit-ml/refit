FROM openjdk:8 as builder

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update

RUN apt-get install sbt scala wait-for-it -y

WORKDIR app

ADD ./ /app

CMD wait-for-it ${PULSAR_HOST}:6650 -t 300 -s -- wait-for-it ${CASSANDRA_HOST}:9042 -t 300 -s -- sbt ${Project}/run
