pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/Chintankumar5799/Java_Jenkin_Docker']]
                )
                bat 'mvn clean install'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    bat 'docker build -t devops-integration .'
                }
            }
        }
        stage('Push image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'jenkinDocker', variable: 'jenkinDocker')]) {
                        bat "docker login -u chintankumar5799 -p %jenkinDocker%"
                    }
                    bat 'docker tag devops-integration chintankumar5799/devops-integration'
                    bat 'docker push chintankumar5799/devops-integration'
                }
            }
        }
    }
}
