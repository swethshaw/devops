pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Harshit1103/react-docker.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t react-container .'
            }
        }

        stage('Docker Run') {
            steps {
                bat '''
    docker stop react-container || echo "No container to stop"
    docker rm react-container || echo "No container to remove"
'''

                
                bat 'docker run -d -p 8080:80 --name react-container react-container'
            }
        }
    }
}
