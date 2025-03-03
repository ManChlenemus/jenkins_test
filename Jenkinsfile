pipeline {
    agent any  // Запускать на любом доступном агенте

    triggers {
        githubPush()
    }
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
                    // Создаем директорию для сборки (если она не существует)
                    bat 'if not exist build2 mkdir build2'
                    dir('build2') {
                        // Генерируем файлы сборки и собираем проект
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
                    // Проверяем содержимое рабочей директории
                    bat 'dir'
                    // Запускаем тестовый скрипт
                    bat '.\\test.bat'
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