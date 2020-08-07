pipeline {
    agent {
        kubernetes {
            yamlFile 'AgentPod.yaml'
        }
    }
    stages {
        stage('Test') {
            steps {
                container('nodejs') {
                    sh 'node --version'
                }
            }
        }
    }
}