pipeline {
    agent { label 'local_node' }

    stages {
        stage('Creating work directory') {
            steps {
                script {
                    sh 'mkdir -p $HOME/tmpwork'
                    sh 'cd $HOME/tmpwork && pwd'
                }
            }
        }

        stage('Clone repo, revision main') {
            steps {
                script {
                    // Clone the repo, branch main
                    dir('mi-directorio-especifico') {
                        git branch: 'main',
                            url: 'https://github.com/emersonacuna/projectDevops.git'
                        sh 'pwd'
                        sh 'ls -al'
                    }
                }
            }
        }
/*      
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
*/
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
