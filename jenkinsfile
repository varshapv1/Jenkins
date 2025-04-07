pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/nginx-demo-varsha"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t nginx-demo .'
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    sh "docker tag nginx-demo:latest $ECR_REPO:$IMAGE_TAG"
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    sh "aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO"
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh "docker push $ECR_REPO:$IMAGE_TAG"
                }
            }
        }
    }
}
