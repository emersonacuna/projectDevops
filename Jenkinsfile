pipeline {
    agent { label 'local_node' }

    stages {
        stage('Creating work directory') {
            steps {
                script {
                    sh 'mkdir -p $HOME/tmpwork'
                }
            }
        }

        stage('Clone repo, revision main') {
            steps {
                script {
                    // Clone the repo, branch main, to a worker directory
                    sh 'git clone https://github.com/emersonacuna/projectDevops.git $HOME/tmpwork'
                    sh 'cd $HOME/tmpwork && ls -al'
                }
            }
        }
     
        stage('Installing docker') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Running ansible playbooks for installing docker"
                    sh 'cd $HOME/tmpwork'
                    sh 'ansible-playbook install-docker.yaml'
                }
            }
        }

        stage('Deploying Apache server') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Building the apache server"
                    sh 'cd $HOME/tmpwork'
                    sh 'ls -al'
                    sh "ansible-playbook build-run-web.yaml"
                }
            }
        }

        stage('Check and remove container if not running') {
            steps {
                script {
                    def containerName = 'myweb' 
                    def status = sh(script: "docker ps -q -f name=${containerName}", returnStdout: true).trim()

                    if (status) {
                        echo "Container ${containerName} is running"
                    } else {
                        echo "Container ${containerName} is not running. Deleting it ..."
                        sh "docker rm ${containerName}"
                    }
                }
            }
        }

    }
    post {
        always {
            echo 'Cleaning and terminating the pipeline'
            script {
                sh 'sudo rm -rf $HOME/tmpwork'
                echo "Temporal directory deleted"
            }
        }
    }
}
