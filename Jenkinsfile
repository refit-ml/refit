pipeline {
    agent any
    stages {
        stage('Test') {
            environment { 
                SBT_HOME="/opt/bitnami/jenkins/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/Default/bin"
            }
            steps {
                // sbt test
                sh "${SBT_HOME}/sbt test"
            }
        }
    }
}