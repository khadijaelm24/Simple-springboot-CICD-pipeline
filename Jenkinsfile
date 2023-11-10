pipeline {
    agent any
    
    tools{
        jdk "jdk17"
        maven "maven3"
    }

    stages {
        stage('Git Checkout') {
            steps {
                // get the checkout from the pipeline syntax dedicated to GitHub
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/khadijaelm24/Simple-springboot-CICD-pipeline.git'
            }
        }
        stage('COMPILE') {
            steps {
                // using windows, we run commands using 'bat'
                // this cmd is used in order to compile the spring boot app except unit tests
                bat "mvn clean compile -DskipTests=true"
            }
        }
        stage('Build') {
            steps {
                // using windows, we run commands using 'bat'
                // this cmd is used in order to run the spring boot app except unit tests
                bat "mvn clean package -DskipTests=true"
            }
        }
        stage('Docker Build & Tag'){
            steps{
                script{
                        
                        //docker build cmd (-f for indicating the file)
                        bat "docker build -t helloworld -f Dockerfile ."
                        
                        //docker tag
                        bat "docker tag helloworld khadijaelm24/helloworld:latest"
                        
                }
            }
        }
        stage('Push Docker image to DockerHub'){
            steps{
                script{
                    
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        // some block
                        bat "docker login -u khadijaelm24 -p ${dockerhubpwd}"
                        
                        bat "docker push khadijaelm24/helloworld"
                    }
                    
                }
            }
        }
        
    }
}
