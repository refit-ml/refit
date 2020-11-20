FROM flink:1.11.2-scala_2.12-java11



RUN apt-get update
RUN apt-get install -y gcc libgomp1 wget software-properties-common build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

#RUN mkdir temp
#ADD install.sh temp/install.sh
#RUN chmod +x temp/install.sh
#WORKDIR temp
#RUN ./install.sh

#RUN python3.8 --version
#RUN python3 --version

RUN apt-get install python3 python3-pip -y

RUN pip3 --version
RUN python3 --version

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

RUN mkdir /opt/flink/plugins/s3-fs-presto

ADD requirements.txt /tmp/lib/requirements.txt
RUN pip install -r /tmp/lib/requirements.txt

RUN wget -P /opt/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.11.2/flink-sql-connector-kafka_2.12-1.11.2.jar
RUN wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-s3-fs-presto/1.11.2/flink-s3-fs-presto-1.11.2.jar

RUN wget -P /opt/flink/plugins/s3-fs-presto https://repo1.maven.org/maven2/org/apache/flink/flink-s3-fs-presto/1.11.2/flink-s3-fs-presto-1.11.2.jar
