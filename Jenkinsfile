pipeline {
    agent any

    stages {
        stage('Prepare Workspace') {
            steps {
                // Clean the workspace to remove any previous builds
                deleteDir()
            }
        }

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
