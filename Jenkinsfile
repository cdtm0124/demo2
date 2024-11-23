pipeline {
    agent any

    stages {
        stage('GetProject') {
            steps {
                git branch: 'main', url: 'https://github.com/cdtm0124/demo2.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Verify WAR File') {
            steps {
                sh 'test -f target/demo.war || { echo "WAR file not found! Build failed."; exit 1; }'
            }
        }
        stage('Archive') {
            steps {
                archiveArtifacts allowEmptyArchive: true, artifacts: '**/demo*.war'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -f Dockerfile -t myapp .'
                sh 'docker rm -f "myappcontainer" || true'
                sh 'docker run --name "myappcontainer" -p 9090:8080 --detach myapp:latest'
            }
        }
    }
}
