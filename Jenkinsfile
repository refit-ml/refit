pipeline {
    agent {
        kubernetes {
            yamlFile 'AgentPod.yaml'
        }
    }
    stages {
        stage('Build') {
            steps {
                container('build') {
                    sh 'sbt compile'
                }
            }
        }
        stage('Test') {
            steps {
                container('build') {
                    sh 'sbt test'
                }
            }
        }

        stage('Deploy') {
            when { branch 'artifacts' }
            environment {
              JOB_ID = sh(script: "flink -m flink-jobmanager:6123 list | sed -n 3p | cut -c23-54", returnStdout: true)
              SAVEPOINT = sh(script: "flink -m flink-jobmanager:6123 savepoint $JOB_ID savepoints/refit/inference | sed -n 3p | cut -c33-", returnStdout: true)
            }
            steps {
                container('build') {
                    sh 'sbt inference/assembly'
                    echo "Start deploy with JobID: $JOB_ID SAVEPOINT: $SAVEPOINT"
                    sh "flink stop -m flink-jobmanager:6123 $JOB_ID;"
                    sh "flink run -m flink-jobmanager:6123 -d -s $SAVEPOINT inference/target/scala-2.11/inference.jar"
                }
            }
        }
    }
}