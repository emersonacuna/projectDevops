pipeline {
    agent {
        label 'principal'
    }

    environment {
        ANSIBLE_PLAYBOOK = 'install_docker.yml' // Nombre del playbook
        INVENTORY_FILE = 'hosts' // Archivo de inventario
    }

    stages {
        stage('Preparar Entorno') {
            steps {
                script {
                    // Verificar si Ansible está instalado
                    def ansibleInstalled = sh(script: 'which ansible', returnStatus: true) == 0
                    if (!ansibleInstalled) {
                        echo 'Instalando Ansible...'
                        sh 'pip install ansible'
                    }
                }
            }
        }

        stage('Ejecutar Playbook de Ansible') {
            steps {
                script {
                    // Ejecutar el playbook de Ansible
                    sh "ansible-playbook -i ${INVENTORY_FILE} ${ANSIBLE_PLAYBOOK}"
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
