@Library('shared')_

pipeline {
    agent { label 'him' }

    stages {
            
        stage('Code') {
            steps {
                echo "This is cloning the code"
                clone('https://github.com/himanshu-10/django_notes_app.git','main')
                echo "Code cloning successful"
            }
        }

        stage('Build') {
            steps {
                echo "This is building the code"
                sh 'docker build -t notes-app:latest .'
            }
        }

        stage('Push to Docker HUB') {
            steps {
                echo "This is pushing the code to hub"

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerHubCred',
                        usernameVariable: 'dockerHubUser',
                        passwordVariable: 'dockerHubPass'
                    )
                ]) {
                    sh '''
                        echo "$dockerHubPass" | docker login -u "$dockerHubUser" --password-stdin
                        docker tag notes-app:latest $dockerHubUser/notes-app:latest
                        docker push $dockerHubUser/notes-app:latest
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the code"
                deploy()
            }
        }
    }
}
