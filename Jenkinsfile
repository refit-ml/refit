pipeline {
  agent {
    kubernetes {
      yamlFile 'AgentPod.yaml'
    }
  }
  stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
   }
}