FROM openjdk:8

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update

RUN apt-get install sbt scala -y

WORKDIR app

ADD ./ /app

RUN ls

CMD sbt run

# CMD scala /app/target/scala-2.13/data_2.13-0.1.jar