@echo off

REM Compile the C++ program (if necessary - assumes g++ is installed and in PATH)
REM g++ main.cpp -o main.exe

REM Run the program and capture the output
FOR /F "tokens=*" %%A IN ('main.exe') DO (
    SET output=%%A
)

REM Define the expected output
SET expected=hello

REM Compare the actual and expected outputs
IF "%output%"=="%expected%" (
    echo Test passed!
    exit 0
) ELSE (
    echo Test failed! Expected "%expected%", but got "%output%"
    exit 1
)