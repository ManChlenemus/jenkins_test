cmake_minimum_required(VERSION 3.10)  # Минимальная версия CMake

project(jenkins-test)  # Название проекта

set(CMAKE_CXX_STANDARD 14)  # Используем стандарт C++14

# Добавляем исполняемый файл
add_executable(jenkins-test main.cpp)