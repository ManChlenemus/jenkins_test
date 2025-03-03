@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Запускаем программу и перенаправляем вывод в файл
jenkins-test > output.txt

REM Читаем первую строку из файла
SET /P output=<output.txt

REM Ожидаемый результат
SET "expected=hello"

IF "!output!"=="!expected!" (
    echo Test passed!
    exit /b 0
) ELSE (
    echo Test fled!
    exit /b 1
)

ENDLOCAL