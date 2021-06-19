pipeline {
  agent any

  stages {
    stage("build") {
      steps {
        echo 'bulding....'
        sh 'bundle install'
        sh 'yarn'
      }
    }

    stage("test") {
      steps {
        echo 'testing....'
      }
    }
  }
}
