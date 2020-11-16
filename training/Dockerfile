from jupyter/base-notebook:latest

USER root

RUN apt-get update

RUN apt-get install default-jre -y

RUN wget -P /libs/flink/ https://apache.claz.org/flink/flink-1.11.2/flink-1.11.2-bin-scala_2.12.tgz

RUN tar -xvzf /libs/flink/flink-1.11.2-bin-scala_2.12.tgz

COPY refit/ /libs/refit/

RUN chmod +x /libs/refit/refit_init

ENV PATH="/libs/refit/:/libs/flink/flink-1.11.2-bin-scala_2.12/bin:${PATH}"

USER $NB_UID