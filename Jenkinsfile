pipeline {
    agent {
        kubernetes {
            yamlFile 'AgentPod.yaml'
        }
    }
    stages {
        stage('Test') {
            steps {
                container('sbt') {
                    sh 'sbt --version'
                    sh 'sbt test'
                }
            }
        }
    }
}