FROM openjdk:8

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update

RUN apt-get install sbt scala -y

RUN wget http://mirrors.ibiblio.org/apache/tests.spark/tests.spark-3.0.0/tests.spark-3.0.0-bin-hadoop2.7.tgz

RUN tar xvf tests.spark-*

RUN mv tests.spark-3.0.0-bin-hadoop2.7 /opt/tests.spark

ENV PATH="/opt/tests.spark/bin:${PATH}"
ENV SPARK_HOME="/opt/tests.spark/"

WORKDIR app

ADD ./ /app

RUN sbt package

CMD tests.spark-submit \
  --class "Main" \
  --master local[4] \
  target/scala-2.10/inference_2.10-1.0.jar