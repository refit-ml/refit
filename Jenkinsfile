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
                    sh ''' echo start deploy job
                        jobId=$(flink -m flink-jobmanager:6123 list | sed -n 3p | cut -c23-54)
                        file=$(flink -m flink-jobmanager:6123 savepoint ${jobId} savepoints/refit/inference | sed -n 3p | cut -c33-)
                        echo JOB: $jobId FILE: $file
                        flink stop -m flink-jobmanager:6123 ${jobId}
                        flink run -m flink-jobmanager:6123 -d inference/target/scala-2.11/inference.jar
                    '''
                }
            }
        }
    }
}