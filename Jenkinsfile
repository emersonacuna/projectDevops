pipeline {
    agent { label 'local_node' }
    environment {
        ANSIBLE_PLAYBOOK = '/home/emerson/ansible/docker/install-docker.yaml' // Nombre del playbook
        //INVENTORY_FILE = 'hosts' // Archivo de inventario
    }

    stages {
        stage('Preparar Entorno') {
            steps {
                script {
                    echo "Preparando entorno"
                    sh "pwd"
                    sh "hostnamectl"
                }
            }
        }

        stage('Ejecutar Playbook de Ansible') {
            steps {
                script {
                    // Ejecutar el playbook de Ansible
                    sh "ansible-playbook ${ANSIBLE_PLAYBOOK}"
                }
            }
        }

        stage('Git clone') {
            steps {
                git url: 'https://github.com/emersonacuna/projectDevops.git'
            }
        }

        stage('Build image and run docker') {
            steps {
                script {
                    dir('projectDevops') { 
                        sh 'docker build . -t myapp'
                    }
                    sh 'docker run -d --name myweb myapp'
                }
            }
        }
    }

    post {
        always {
            echo 'Limpieza y finalización del pipeline.'
            script {
                sh 'rm -rf projectDevops' // Elimina el directorio clonado
            }
        }
    }
}
