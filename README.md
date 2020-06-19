# IOT Prototype
This is a monorepo for the Center for Deep Learning IOT Prototype

## Components

### Data
This is our initial data creation area. This project is mainly used to create and maintain test data sets that we can forward to the ingestion service.
### Ingestion
This is where our system will take in data. The current task is to decide between Kafka, Pulsar, or some other distributed message queue. 

### Inference
This is where the ML model will perform inference. Currently we are deciding between Spark and Flink (& other distributed data processing frameworks)

### Persistance
This is where we will store our data for further enhancements and training of our ML model (used in the inference step)

## Local Development
Our current language of choice is to use [Scala](https://www.scala-lang.org/). Scala runs on the JVM and natively plugs into many of the technologies mentioned in each component. Scala also runs on the JVM which makes it very developer friendly. 

### Running
In order to run all of the projects above you only need [docker](https://www.docker.com/) installed on your machine.

#### Steps

- Open your shell
- Change into the iot-prototype directory
- run `chmod +x run` to make the run script executable
- run `./run` to start up all of the iot-prototype infrastructure in local mode
    
## Development & Testing
In order to write code, unit tests, and run your code in a developer friendly environment you will need the following

- An IDE/Text Editor
    - Some Suggestions
        - [IDEA](https://www.jetbrains.com/idea/) (IDEA Ultimate is free for Northwestern students). If you are using IDEA you will want to install the Scala SDK in the packages section [Here](https://docs.scala-lang.org/getting-started/intellij-track/getting-started-with-scala-in-intellij.html) is a tutorial.
        - [VS Code](https://code.visualstudio.com/)
    - NOTE: If you are accustom to GUI tools then IDEA will be preferred, if you prefer command-line development then VS Code might be for you
- [JDK](https://openjdk.java.net/)
    - right now all of our docker containers are using openjdk 8 (this might change in the future)
- [SBT](https://www.scala-sbt.org/)
- Shell
    - If you are on a Mac/Linux machine then you will not need to install anything
    - If you are on Windows you will want to install the [Ubuntu Subsystem](https://ubuntu.com/tutorials/tutorial-ubuntu-on-windows#1-overview)