pipeline {
  environment {
    registry = "raji2306/jenkinsdockerimage"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
   stages{
       stage("GitHub Checkout Stage"){
           steps{
               git credentialsId:'Git-ssh', url: 'git@github.com:raji2306/java-hello-world-with-maven.git'
          }
        }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
