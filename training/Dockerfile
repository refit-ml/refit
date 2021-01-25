FROM flink:1.11.2-scala_2.12-java11


FROM jupyter/base-notebook:python-3.7.6


USER root


RUN apt-get update

RUN apt-get install default-jre \
    software-properties-common \
    python3 \
    python3-pip \
    git \
    unzip -y
    
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

WORKDIR /home/jovyan

USER root

COPY --from=0 /opt/flink/ /libs/flink
RUN wget -P /libs/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.11.2/flink-sql-connector-kafka_2.12-1.11.2.jar

COPY refit/ /libs/refit/

RUN chmod +x /libs/refit/refit_init

ENV PATH="/libs/refit/:/libs/flink/bin:${PATH}"

RUN mkdir /home/jovyan/demo
RUN mkdir /home/jovyan/demo/notebooks
RUN mkdir /home/jovyan/demo/data

COPY notebooks/ /home/jovyan/demo/notebooks
COPY data/ /home/jovyan/demo/data

RUN chmod -R 777 /home/jovyan
RUN chmod -R 777 /libs/flink

USER $NB_UID

