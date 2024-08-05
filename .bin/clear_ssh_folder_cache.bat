@echo off
REM Delete sqlite3 DB storing cache of VSCode SSH folder

REM Set UTF-8 code page
chcp 65001 >nul

set homeDir=%USERPROFILE%
set targetFile=%homeDir%\AppData\Roaming\Code\User\globalStorage\state.vscdb
set backupFile=%targetFile%.bak

echo Starting file check and backup process...

if exist "%targetFile%" (
    REM Create a backup
    copy "%targetFile%" "%backupFile%" >nul 2>&1
    if %errorlevel% equ 0 (
        echo Backup created: %backupFile%
    ) else (
        echo Failed to create backup.
        goto end
    )

    REM Delete the file
    del "%targetFile%" >nul 2>&1
    if %errorlevel% equ 0 (
        echo File deleted: %targetFile%
    ) else (
        echo Failed to delete file.
    )
) else (
    echo File not found: %targetFile%
)
:end
echo Process completed.
pause
