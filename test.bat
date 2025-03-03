@echo off
REM Запускаем программу и сохраняем вывод в файл
.\build2\Debug\jenkins-test.exe > output.txt

REM Читаем вывод из файла
SET /P output=<output.txt

REM Ожидаемый результат
SET expected=hello

REM Сравниваем вывод с ожидаемым результатом
IF "%output%"=="%expected%" (
    echo Test passed!
    exit /b 0
) ELSE (
    echo Test failed!
    echo Expected: "%expected%", but got: "%output%"
    exit /b 1
)