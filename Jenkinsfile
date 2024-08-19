pipeline {
    agent { label 'local_node' }

    stages {
        stage('Preparing environment') {
            steps {
                script {
                    echo "Preparing environmet"
                    sh "pwd"
                    sh "hostnamectl"
                }
            }
        }

        stage('Clone repo, revision main') {
            steps {
                script {
                    // Clone the repo, branch main
                    git branch: 'main',
                        url: 'https://github.com/emersonacuna/projectDevops.git'
                }
            }
        }
      
        stage('Installing docker') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Running ansible playbooks for installing docker"
                    sh 'ansible-playbook install-docker.yaml'
                }
            }
        }

        stage('Deploying Apache server') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Building the apache server"
                    sh "ansible-playbook build-run-web.yaml"
                }
            }
        }

    }

    post {
        always {
            echo 'Cleaning and terminating the pipeline'
            script {
                echo "Cleaning completed"
            }
        }
    }
}
