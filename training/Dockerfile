from jupyter/base-notebook:latest

USER root

RUN apt-get update

RUN apt-get install default-jre -y

RUN wget -P /libs/flink/ https://apache.claz.org/flink/flink-1.11.2/flink-1.11.2-bin-scala_2.12.tgz
RUN tar -xvzf /libs/flink/flink-1.11.2-bin-scala_2.12.tgz --directory /libs/flink/
RUN wget -P /libs/flink/flink-1.11.2/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.11.2/flink-sql-connector-kafka_2.12-1.11.2.jar

COPY refit/ /libs/refit/

RUN chmod +x /libs/refit/refit_init

ENV PATH="/libs/refit/:/libs/flink/flink-1.11.2/bin:${PATH}"

RUN mkdir /home/jovyan/demo
RUN mkdir /home/jovyan/demo/notebooks
RUN mkdir /home/jovyan/demo/data



COPY notebooks/ /home/jovyan/demo/notebooks
COPY data/ /home/jovyan/demo/data

RUN chmod -R 777 /home/jovyan
RUN chmod -R 777 /libs/flink

USER $NB_UID