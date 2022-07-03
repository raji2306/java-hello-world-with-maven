pipeline {
    environment {
        registry = "raji2306/jenkinsdockerimage"
        registryCredential = "dockerhub"
        dockerImage=''
    }
    agent any
//     tools {
//         maven 'maven'
//         jdk 'java'
//     }
    stages{
        stage("GitHub Checkout Stage"){
            steps{
                git credentialsId:'Git-ssh', url: 'git@github.com:raji2306/java-hello-world-with-maven.git'
            }
        }
//         stage("Maven Build Stage"){
//             steps{
//                 sh 'mvn clean install'
//             }
//         }
        stage("Pushing into the Docker Hub"){
            steps{
                script{
                    docker.withRegistry('',registryCredential ){
                        dockerImage.push()
                    }
                }
            }
        }
        stage ("Running an Docker Container"){
            steps{
                script {
                    docker run -itd 
                }
            }
        }
        stage ("Removing unused docker image"){
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
//         stage("Deploy to Tomcat Server"){
//             steps{
//                 script{
//                     deploy adapters: [tomcat9(credentialsId:'Tomcat-user', path:'',url:'http://13.232.82.57:8080')],contextPath:'/pipeline', onFailure: false, war: '**/*.war'
//                }
//             }
//         }
//         stage("Running Ansible Playbook"){
//             steps{
//                 ansiblePlaybook credentialsId: 'ansible-play', disableHostKeyChecking: true, installation: 'ansible', inventory: 'host', playbook: '/etc/ansible/tomcat.yaml'
//             }    
//         }
    }
}
