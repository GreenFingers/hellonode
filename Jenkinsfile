pipeline {

  agent {
    docker {
      image 'node:latest'
    } 
  }

  parameters {
      string(name: 'staging_server', defaultValue: '18.184.0.134', description: 'Staging server')
      string(name: 'tomcat_prod', defaultValue: '18.197.95.235', description: 'Production server')
  }

  triggers {
    pollSCM('')
  }

  stages {
    stage('Build') {
      steps {
        sh 'npm install'
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
