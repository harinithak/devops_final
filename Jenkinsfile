pipeline {
    agent any

    environment {
        IMAGE_NAME = 'harinitha/signup-page'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Assumes Jenkins is connected to your Git repo
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: '21-Mar-05')]) {
                    script {
                        sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                        sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    // Optional: kill old container if running
                    sh 'docker rm -f signup-container || true'
                    sh 'docker run -d --name signup-container -p 8080:80 $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }
}
