pipeline {
    agent any  // Запуск на любом доступном агенте

    environment {
        // Переменные окружения (опционально)
        BUILD_DIR = "build"
        EXECUTABLE = "bin/MyJenkinsProject"
    }

    stages {
        // Этап подготовки
        stage('Prepare') {
            steps {
                echo "Preparing the environment..."
                cleanWs()  // Очистка рабочей директории
            }
        }

        // Этап сборки
        stage('Build') {
            steps {
                echo "Building the project..."
                script {
                    bat '''
                        mkdir ${BUILD_DIR}
                        cd ${BUILD_DIR}
                        cmake ..
                        cmake --build . --config Debug
                    '''
                }
            }
        }

        // Этап тестирования
        stage('Test') {
            steps {
                echo "Running tests..."
                script {
                    bat '''
                        cd ${BUILD_DIR}
                        if exist ${EXECUTABLE} (
                            ${EXECUTABLE}
                        ) else (
                            echo "Error: Executable not found!"
                            exit 1
                        )
                    '''
                }
            }
        }

        // Этап архивирования артефактов (опционально)
        stage('Archive Artifacts') {
            steps {
                echo "Archiving artifacts..."
                archiveArtifacts artifacts: '${BUILD_DIR}/**/*.exe', fingerprint: true
            }
        }
    }

    // Пост-обработка
    post {
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed!"
        }
        always {
            echo "Cleaning up..."
            // Дополнительные действия, которые выполняются всегда
        }
    }
}