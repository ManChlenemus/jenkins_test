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
                // sh 'ls -la'  // Для Linux
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                script {
                    // Создаем директорию для сборки
                    bat 'mkdir test_build'
                    bat 'cd test_build'

                    // Запускаем CMake и собираем проект
                    bat 'cmake ..'
                    bat 'cmake --build . --config Debug'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    // Запускаем тестовый скрипт
                    bat 'cd build'
                    bat '..\\test.sh'
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