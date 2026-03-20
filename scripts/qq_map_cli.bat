@echo off
setlocal

set "CMD_NAME=qq-map-cli.exe"
set "ZIP_FILE=qq-map-cli.zip"
set "DOWNLOAD_URL=https://github.com/scottkiss/qq-map-cli/releases/download/v1.0.2/qq-map-cli-windows-x86_64.zip"

set "BIN_DIR=%~dp0bin"
set "CMD_PATH=%BIN_DIR%\%CMD_NAME%"

if not exist "%CMD_PATH%" (
    echo Downloading %CMD_NAME%...
    if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"
    curl -L -s "%DOWNLOAD_URL%" -o "%BIN_DIR%\%ZIP_FILE%"
    tar -xf "%BIN_DIR%\%ZIP_FILE%" -C "%BIN_DIR%"
    del "%BIN_DIR%\%ZIP_FILE%"
    echo Download complete: %CMD_PATH%
) else (
    echo %CMD_NAME% is already downloaded at %CMD_PATH%
)
