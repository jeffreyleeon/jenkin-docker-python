pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                checkout scm
                echo "Build and Test Start"
                sh "docker build -t jeffrey-testing ."
                sh "docker run -v /usr/local/automation/logs:/logs/selenium -i --rm jeffrey-testing:latest bash -c 'pytest -v --junitxml=/logs/selenium/results.xml; ls -la /logs/selenium'"
                echo "Build and Test End"
            }
        }
    }

    post {
        always {
            echo "Reporting Start"
            sh "pwd"
            sh "ls -la /usr/local/automation/logs"
            sh "cat /usr/local/automation/logs/results.xml"
            junit allowEmptyResults: true, testResults: '/usr/local/automation/logs/results.xml'
            echo "Reporting End"
            echo "Tearing down Start"
            echo "Tearing down End"
        }
    }
}
