pipeline {
    agent { label 'local_node' }
    environment {
        ANSIBLE_PLAYBOOK1 = '/home/emerson/ansible/docker/install-docker.yaml'
        ANSIBLE_PLAYBOOK2 = '/home/emerson/ansible/docker/build-run-web.yaml'
    }

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

        stage('Installing docker') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Running ansible playbooks for installing docker"
                    sh "ansible-playbook ${ANSIBLE_PLAYBOOK1}"
                }
            }
        }

        stage('Deploying Apache server') {
            steps {
                script {
                    // Run ansible playbooks
                    echo "Building the apache server"
                    sh "ansible-playbook ${ANSIBLE_PLAYBOOK2}"
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
