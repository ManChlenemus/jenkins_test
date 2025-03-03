@echo off

REM Запускаем программу и сохраняем вывод в переменную
FOR /F "tokens=*" %%A IN ('jenkins-test') DO (
    SET output=%%A
)

SET expected=1

IF "%output%"=="%expected%" (
    echo Test passed!
    exit 0
) ELSE (
    echo Test failed!
    exit 1
)