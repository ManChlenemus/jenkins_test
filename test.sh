#!/bin/bash

# Функция для вывода сообщений с временной меткой
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Очистка предыдущей сборки (опционально)
log "Cleaning previous build..."
rm -rf build

# Создание директории для сборки
log "Creating build directory..."
mkdir -p build
cd build

# Генерация Makefile с помощью CMake
log "Generating build files with CMake..."
cmake ..

# Сборка проекта
log "Building the project..."
cmake --build . --config Debug

# Запуск тестов (исполняемого файла)
log "Running tests..."
if [[ -f ./bin/MyJenkinsProject ]]; then
    ./bin/MyJenkinsProject
else
    log "Error: Executable not found!"
    exit 1
fi

log "Build and test completed successfully!"