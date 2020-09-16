# REFIT
This is a monorepo for the Center for Deep Learning IoT platform, REFIT

## Components

### Common
This module contains code that is shared among all services and systems. 
### DAO
This project is much like the common project, however, it only contains common code that is used to connect to our data stores. It is kept in a seperate module because not all projects need access to the databases.
### Protocol
This project houses all of the Protobuf Schemas that define how our services communicate with one another. If you have issues compiling at first, try running the `compile` task in the protocol project, then compile again. On your terminal the command is `sbt protocol/compile`
### Ingestion
This is where our system will take in data. This is an Apache Camel application that has routes to take data, format it to the proper protobuf scheme and publish it in pulsar.
### Inference
This service consumes both models and sensor data from pulsar topics. Using these two the inference project uses live models to create predictions based on the sensor data.
### DB
This project is just here to hold fixtures for local development. The project also has a CQL folder to hold the database schema. Eventually the schema should be moved to a proper schema migration tool.
### Training
This is where the AI Application lives. The training project is a periodic job that builds machine learning models based on historical data in the system. The training project is a python project that uses tensorflow to create and serialize Machine Learning and Deep Learning models.
## Local Development
Our current language of choice is to use [Scala](https://www.scala-lang.org/). Scala runs on the JVM and natively plugs into many of the technologies mentioned in each component. Scala also runs on the JVM which makes it very developer friendly. 
### Test Suite
In order to run the scala test suite, simply enter this command in your terminal `sbt test`. If you want to run tests for only one project, prefix the test command with `${project}/`. For example, if you want to run tests for the inference project you would run `sbt inference/run`

### Running
In order to run all of the projects above you only need [docker](https://www.docker.com/) installed on your machine.
#### Steps

- Open your terminal
- run `chmod +x run` to make the run script executable
- run `./run` to start up all of the iot-prototype infrastructure in local mode
    
## Development & Testing
In order to write code, unit tests, and run your code in a developer friendly environment you will need the following

- An IDE/Text Editor
    - Some Suggestions
        - [IDEA](https://www.jetbrains.com/idea/) (IDEA Ultimate is free for Northwestern students). If you are using IDEA you will want to install the Scala SDK in the packages section [Here](https://docs.scala-lang.org/getting-started/intellij-track/getting-started-with-scala-in-intellij.html) is a tutorial.
        - [VS Code](https://code.visualstudio.com/)
    - NOTE: If you are accustom to GUI tools then IDEA will be preferred, if you prefer command-line development then VS Code might be for you
- [JDK](https://openjdk.java.net/): For compiling scala code
    - right now all of our docker containers are using openjdk 8 (this might change in the future)
- [SBT](https://www.scala-sbt.org/): This will let you build, compile, and run your scala code
- Shell: All of our build/test scripts will be written in shell
    - If you are on a Mac/Linux machine then you will not need to install anything
    - If you are on Windows you will want to install the [Ubuntu Subsystem](https://ubuntu.com/tutorials/tutorial-ubuntu-on-windows#1-overview)
    
# Deployment
To provide your own schemas to REFIT you must first create a configmap with all of the schema files. `kubectl create configmap test-schemas --from-file schemas`. In your values.yaml, set the `refit.schemaConfigMap` value equal to your configmap name.