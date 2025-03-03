pipeline {
    agent any

    environment {
        BUILD_DIR = "build"  // Определяем переменную BUILD_DIR
    }

    stages {
        stage('Prepare') {
            steps {
                echo 'Preparing the environment...'
                cleanWs()  // Очистка рабочей директории
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                script {
                    bat 'mkdir build'  // Создаем директорию build
                    bat 'cd build'     // Переходим в директорию build
                    bat 'cmake ..'     // Запускаем CMake
                    bat 'cmake --build . --config Debug'  // Собираем проект
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Добавь команды для запуска тестов
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo 'Archiving artifacts...'
                // Добавь команды для архивирования артефактов
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