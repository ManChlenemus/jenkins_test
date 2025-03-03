#!/bin/bash

# Запускаем программу и проверяем вывод
output=$(./jenkins-test)
expected="Hello, Jenkins!"

if [[ "$output" == "$expected" ]]; then
    echo "Test passed!"
    exit 0
else
    echo "Test failed!"
    exit 1
fi