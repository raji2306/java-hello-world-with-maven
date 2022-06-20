pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'java'
    }
    stages{
        stage("GitHub Checkout Stage"){
            steps{
                git credentialsId:'Git-ssh', url: 'git@github.com:raji2306/java-hello-world-with-maven.git'
            }
        }
        stage("Maven Build Stage"){
            steps{
                sh 'mvn clean install'
            }
        }
        stage("Deploy to Tomcat Server"){
            steps{
                script{
                    deploy adapters: [tomcat9(credentialsId:'Tomcat-user', path:'',url:'http://13.232.82.57:8080')],contextPath:'/pipeline', onFailure: false, war: '**/*.war'
               }
            }
        }
    }
}
