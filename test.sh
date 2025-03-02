#!/bin/bash

echo "Building..."
mkdir -p build
cd build
cmake ..
cmake --build .

echo "Running tests..."
./Debug/MyJenkinsProject.exe  # Для Windows (Debug конфигурация)
# ./MyJenkinsProject          # Для Linux/macOS