@echo off

if "%1" == "" (
    echo usage: configure.bat ^[ arm64 ^| amd64 ^]
    exit /b 1
)

setlocal

if /I "%1" == "amd64" (
    set arch=amd64
) else if /I "%1" == "arm64" (
    set arch=arm64
) else (
    echo error: unrecognized platform %1
    exit /b 1
)

set MY_DIR=%~dp0
if "%MY_DIR%" == "%CD%\" (
    mkdir bin 2> nul
    mkdir bin\%arch% 2> nul
    cd bin\%arch%
)

del CMakeCache.txt 2> nul
cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE="%MY_DIR:\=/%/toolchain-%arch%.cmake" "%MY_DIR:\=/%"
