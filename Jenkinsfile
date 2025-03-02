pipeline {
    agent any  // Запускаем Pipeline на любом доступном агенте

    stages {
        // Этап подготовки (опционально)
        stage('Prepare') {
            steps {
                echo "Preparing the environment..."
                // Очистка рабочей директории (опционально)
                cleanWs()
            }
        }

        // Этап сборки проекта
        stage('Build') {
            steps {
                echo "Building the project..."
                script {
                    // Для Windows
                    bat '''
                        mkdir build
                        cd build
                        cmake ..
                        cmake --build . --config Debug
                    '''
                    // Для Linux/macOS замените bat на sh и используйте:
                    // sh '''
                    //     mkdir -p build
                    //     cd build
                    //     cmake ..
                    //     cmake --build .
                    // '''
                }
            }
        }

        // Этап запуска тестов
        stage('Test') {
            steps {
                echo "Running tests..."
                script {
                    // Для Windows
                    bat '''
                        cd build
                        ./Debug/MyJenkinsProject.exe
                    '''
                }
            }
        }

        // Этап архивирования артефактов (опционально)
        stage('Archive Artifacts') {
            steps {
                echo "Archiving artifacts..."
                archiveArtifacts artifacts: 'build/**/*.exe', fingerprint: true  // Для Windows
                // archiveArtifacts artifacts: 'build/MyJenkinsProject', fingerprint: true  // Для Linux/macOS
            }
        }
    }

    // Пост-обработка (опционально)
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