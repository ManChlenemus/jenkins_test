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
                    bat 'mkdir build'  // Создай директорию build
                    dir('build') {     // Перейди в директорию build
                        bat 'cmake ..'
                        bat 'cmake --build . --config Debug'
                    }

                    echo 'Checking out the repository...'
                    checkout scm  // Клонирование репозитория
                    bat 'dir'

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