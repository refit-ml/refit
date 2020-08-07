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
                    sh 'sbt --version'
                    sh 'sbt compile'
                }
            }
        }
        stage('Test') {
            steps {
                container('sbt') {
                    sh 'sbt --version'
                    sh 'sbt test'
                }
            }
        }

        stage('Assembly') {
            steps {
                container('sbt') {
                    sh 'sbt --version'
                    sh 'sbt assembly'
                }
            }
        }
    }
}