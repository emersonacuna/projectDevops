pipeline {
    agent { label 'master' }
    environment {
        ANSIBLE_PLAYBOOK = '/home/emerson/ansible/docker/install-docker.yaml' // Nombre del playbook
        //INVENTORY_FILE = 'hosts' // Archivo de inventario
    }

    stages {
        stage('Preparar Entorno') {
            steps {
                script {
                    // Verificar si Ansible está instalado
                    // def ansibleInstalled = sh(script: 'which ansible', returnStatus: true) == 0
                    // if (!ansibleInstalled) {
                        // echo 'Instalando Ansible...'
                        // sh 'pip install ansible'
                    echo "Preparando entorno"
                    sh "pwd"
                    sh "hostnamectl"
                    // }
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
    }

    post {
        always {
            echo 'Limpieza y finalización del pipeline.'
            // Aquí puedes agregar pasos para limpiar recursos o notificaciones, si es necesario.
        }
    }
}
