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
            archiveArtifacts artifacts: '**/*'
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
        withCredentials([sshUserPrivateKey(credentialsId:'ec2-staging', keyFileVariable:'keyfile')]) {
          sh 'rm -rf .git'
          sh "scp -o StrictHostKeyChecking=no -i ${keyfile} -r . ${params.deploy_user}@${params.staging_server}:~/www/"
          sh "ssh -o StrictHostKeyChecking=no -i ${keyfile} ${params.deploy_user}@${params.staging_server} /home/${params.deploy_user}/www/start.sh"
        }
      }
    }

  }


}
