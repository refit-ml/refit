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
            steps {
                container('build') {
                    sh 'sbt inference/assembly'
                    sh 'build.sh'
                }
            }
        }
    }
}