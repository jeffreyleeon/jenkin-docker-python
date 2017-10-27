pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                checkout scm
                sh "mkdir -p /Users/leechunon/Documents/self-projects/docker/logs"
                echo "Build and Test Start"
                sh "docker build -t jeffrey-testing ."
                sh "docker run -v /Users/leechunon/Documents/self-projects/docker/logs:/logs/selenium -i --rm jeffrey-testing:latest bash -c 'pytest -v --junitxml=/logs/selenium/results.xml; ls -la /logs/selenium'"
                echo "Build and Test End"
            }
        }
    }

    post {
        always {
            echo "Reporting Start"
            sh "pwd"
            sh "ls -la /Users/leechunon/Documents/self-projects/docker/logs"
            sh "cat /Users/leechunon/Documents/self-projects/docker/logs/results.xml"
            junit allowEmptyResults: true, testResults: '/Users/leechunon/Documents/self-projects/docker/logs/results.xml'
            echo "Reporting End"
            echo "Tearing down Start"
            echo "Tearing down End"
        }
    }
}
