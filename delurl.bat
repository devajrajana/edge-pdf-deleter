@echo off
:: Pull the URL directly from the Windows Clipboard using PowerShell
for /f "delims=" %%I in ('powershell -NoProfile -Command "Get-Clipboard"') do set "URL=%%I"

:: Ensure it's actually a local file path before doing anything
if "%URL:~0,8%"=="file:///" (
    powershell -WindowStyle Hidden -NoProfile -Command "$path = ([uri]'%URL%').LocalPath; Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($path, 'OnlyErrorDialogs', 'SendToRecycleBin')"
)
exit