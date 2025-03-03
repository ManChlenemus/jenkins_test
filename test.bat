@echo off
REM Очищаем переменную output
SET output=

REM Запускаем программу и сохраняем весь вывод в переменную
FOR /F "delims=" %%A IN ('jenkins-test') DO (
    SET "output=%%A"
)

REM Обходим проблему с расширением переменных внутри IF
SET "expected=hello"

REM Включаем расширенное расширение переменных
SETLOCAL ENABLEDELAYEDEXPANSION

IF "!output!"=="!expected!" (
    echo Test passed!
    exit /b 0
) ELSE (
    echo Test failed!
    exit /b 1
)

ENDLOCAL