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

        stage('Assembly') {
            steps {
                container('build') {
                    sh 'sbt assembly'
                }
            }
        }
    }
}