pipeline {
    agent any  // Запускать на любом доступном агенте

    stages {
        stage('Prepare') {
            steps {
                echo 'Preparing the environment...'
                cleanWs()  // Очистка рабочей директории
            }
        }
        stage('Checkout') {
            steps {
                echo 'Checking out the repository...'
                checkout scm  // Клонирование репозитория
                bat 'dir'  // Вывод содержимого рабочей директории (для Windows)
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                script {
                    // Создаем директорию для сборки
                    bat 'mkdir build2'  // Создай директорию build2
                    dir ('build2') {
                        bat 'cmake ..'
                        bat 'cmake --build . --config Debug'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    bat 'dir'
                    bat 'test.bat'

                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}