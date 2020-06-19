FROM openjdk:8

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update

RUN apt-get install sbt scala -y

RUN wget http://mirrors.ibiblio.org/apache/spark/spark-3.0.0/spark-3.0.0-bin-hadoop2.7.tgz

RUN tar xvf spark-*

RUN mv spark-3.0.0-bin-hadoop2.7 /opt/spark

ENV PATH="/opt/spark/bin:${PATH}"
ENV SPARK_HOME="/opt/spark/"

WORKDIR app

ADD ./ /app

RUN sbt package

CMD spark-submit \
  --class "Main" \
  --master local[4] \
  target/scala-2.10/inference_2.10-1.0.jar