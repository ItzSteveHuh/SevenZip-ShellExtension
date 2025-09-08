@echo off
echo Unregistering 7-Zip Shell Extension...
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running as Administrator - OK
) else (
    echo ERROR: This script must be run as Administrator
    echo Right-click on this file and select "Run as administrator"
    pause
    exit /b 1
)

REM Check if DLL exists
if not exist "SevenZip.ShellExtension.dll" (
    echo ERROR: SevenZip.ShellExtension.dll not found
    pause
    exit /b 1
)

REM Unregister the DLL
echo Unregistering SevenZip.ShellExtension.dll...
regsvr32 /u SevenZip.ShellExtension.dll

if %errorLevel% == 0 (
    echo.
    echo SUCCESS: 7-Zip Shell Extension unregistered successfully!
    echo You may need to restart Windows Explorer for changes to take effect.
) else (
    echo.
    echo ERROR: Unregistration failed
    echo The extension may not have been registered, or there may be permission issues
)

echo.
pause
