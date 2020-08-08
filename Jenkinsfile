pipeline {
    agent {
        kubernetes {
            yamlFile 'AgentPod.yaml'
        }
    }
    stages {
        stage('Build') {
            steps {
                container('sbt') {
                    sh 'sbt compile'
                }
            }
        }
        stage('Test') {
            steps {
                container('sbt') {
                    sh 'sbt test'
                }
            }
        }

        stage('Assembly') {
            steps {
                container('inference') {
                    sh 'sbt inference/assembly'
                    stash includes: 'inference/target/scala-2.11/inference.jar', name: 'flink-jar'
                }
            }
        }

        stage('Deploy') {
            when { branch 'artifacts' }
            steps {
                container('inference') {
                    unstash 'flink-jar'
                    sh 'jobId=$(flink -m flink-jobmanager:6123 list | sed -n 3p | cut -c23-54)'
                    sh 'file=$(flink -m flink-jobmanager:6123 savepoint ${jobId} savepoints/refit/inference | sed -n 3p | cut -c33-)'
                    sh 'flink stop ${jobId}'
                    sh 'flink run -m flink-jobmanager:6123 -d inference/target/scala-2.11/inference.jar '
                }
            }
        }
    }
}