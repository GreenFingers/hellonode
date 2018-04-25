pipeline {

  agent {
    docker {
      image 'node:latest'
    } 
  }

  parameters {
      string(name: 'staging_server', defaultValue: '18.184.0.134', description: 'Staging server')
      string(name: 'deploy_user', defaultValue: 'ec2-user', description: 'Production server')
  }

  triggers {
    pollSCM('')
  }

  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
      post {
        success {
            echo 'Now archiving...'
            archiveArtifacts artifacts: '**/node_modules/*'
        }
      }
    }

    stage('Test image') {
      steps {
        sh 'npm test'
      }
    }

    stage('Push image') {
      steps {
        //scp with sshAgent
        echo 'empty step'
      }
    }

  }


}
