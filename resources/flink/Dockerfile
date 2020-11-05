FROM flink:1.11.2-scala_2.12-java11

RUN apt-get update
RUN apt-get install -y gcc libgomp1 wget python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

RUN mkdir /opt/flink/plugins/s3-fs-presto

ADD requirements.txt /tmp/lib/requirements.txt
RUN pip install -r /tmp/lib/requirements.txt

RUN wget -P /opt/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.11.2/flink-sql-connector-kafka_2.12-1.11.2.jar
RUN wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-s3-fs-presto/1.11.2/flink-s3-fs-presto-1.11.2.jar

RUN wget -P /opt/flink/plugins/s3-fs-presto https://repo1.maven.org/maven2/org/apache/flink/flink-s3-fs-presto/1.11.2/flink-s3-fs-presto-1.11.2.jar
