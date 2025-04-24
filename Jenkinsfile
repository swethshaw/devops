pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-website'
        DOCKER_CONTAINER = 'website-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/swethshaw/devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    sh "docker ps -q --filter 'name=${DOCKER_CONTAINER}' | grep -q . && docker stop ${DOCKER_CONTAINER} || true"
                    sh "docker rm ${DOCKER_CONTAINER} || true"
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh "docker run -d -p 80:80 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Website deployed successfully!'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
