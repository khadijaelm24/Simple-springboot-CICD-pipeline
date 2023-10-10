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
        stage('Docker Build & Push'){
            steps{
                script{
                        
                        //docker build cmd (-f for indicating the file)
                        bat "docker build -t helloworld -f Dockerfile ."
                        
                        //docker tag
                        bat "docker tag helloworld khadijaelm24/helloworld:latest"
                        
                    // This step should not normally be used in your script. Consult the inline help for details.
                    withDockerContainer(image: 'https://hub.docker.com/r/khadijaelm24/helloworld', toolName: 'docker') {
                        // some block
                        
                        //docker push
                        bat "docker push khadijaelm24/helloworld:latest"
                    }
                    // This step should not normally be used in your script. Consult the inline help for details.
                    // withDockerRegistry(credentialsId: 'd4299f35-cc15-4293-af2c-82de82defe25', toolName: 'docker') {
                    //     // some block
                    // }
                }
            }
        }
        
    }
}
