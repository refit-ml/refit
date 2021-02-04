FROM tensorflow/tensorflow:latest-jupyter

RUN apt-get install wget

# Install minio client
# https://docs.min.io/docs/minio-client-quickstart-guide.html
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc
RUN mv mc /bin/mc
RUN chmod +x /bin/mc
RUN mc --version

RUN mkdir /app
WORKDIR /app

COPY run.sh run.sh
RUN chmod +x run.sh

ENTRYPOINT /app/run.sh