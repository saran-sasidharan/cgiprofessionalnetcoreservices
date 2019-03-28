pipeline {
  agent any
  stages {
    stage('Restore and Build') {
      steps {
        sh 'bash ./jenkins/scripts/build.sh'
      }
    }
    stage('Test') {
      steps {
        sh 'bash ./jenkins/scripts/test.sh'
      }
    }
    stage('Publish') {
      steps {
        sh 'bash ./jenkins/scripts/publish.sh'
      }
    }
    stage('Prepare Images') {
      steps {
        sh 'bash ./jenkins/scripts/prepare-image.sh'
      }
    }
    stage('Push Image to Hub') {
      steps {
        sh 'bash ./jenkins/scripts/push-images.sh'
        sh 'bash ./jenkins/scripts/cleanup-images.sh'
      }
    }
    stage('Run Container') {
      steps {
        sh 'bash ./jenkins/scripts/run-container.sh'
        input(message: 'Are you able to see the page?', ok: 'Yes!!')
        sh 'bash ./jenkins/scripts/cleanup-container.sh'
      }
    }
  }
  environment {
    CONTAINER_PORT = '9090'
    HOST_PORT = '9090'
    CONTAINER_NAME = 'restservices'
    DB_CONN_STRING = 'ZGF0YSBzb3VyY2U9aW9tZWdhc3Fsc2VydmVydjIuZGF0YWJhc2Uud2luZG93cy5uZXQ7dXNlciBpZD1pb21lZ2FhZG1pbjtwYXNzd29yZD1QcmVzdGlnZTEyMztpbml0aWFsIGNhdGFsb2c9aW9tZWdhc3FsZGF0YWJhc2V2Mjs='
    BUILD_ID = '1'
    DOCKER_HUB_USER = 'saransasidharan'
    HOME = '.'
    DOCKER_HUB_PASSWORD = '@swasar007buh'
  }
}