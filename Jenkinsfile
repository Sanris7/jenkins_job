pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository containing third.sh
                git 'https://github.com/Sanris7/jenkins_job.git'
            }
        }

        stage('Run third.sh') {
            steps {
                // Give execute permissions and run the third.sh script
                sh '''
                    chmod +x third.sh
                    ./third.sh
                '''
            }
        }
    }
}
