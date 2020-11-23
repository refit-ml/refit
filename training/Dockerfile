FROM jupyter/base-notebook:latest


USER root


RUN apt-get update

RUN apt-get install default-jre software-properties-common python3 python3-pip -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install python3.7 -y
RUN which python3.7

# Install venv as user
USER $NB_UID
RUN mkdir virtual-environments
# RUN mkdir ~/virtual-environments/refit

RUN pip install virtualenv

WORKDIR virtual-environments

RUN virtualenv refit --python=/usr/bin/python3.7
RUN source refit/bin/activate 
RUN pip3 install --user ipykernel
RUN python3 -m ipykernel install --user --name=refit
# RUN jupyter kernelspec uninstall -y python3
RUN jupyter kernelspec list 
# Install flink as root
USER root

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

