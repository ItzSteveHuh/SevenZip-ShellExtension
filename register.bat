@echo off
echo Registering 7-Zip Shell Extension...
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
    echo Please build the project first
    pause
    exit /b 1
)

REM Register the DLL
echo Registering SevenZip.ShellExtension.dll...
regsvr32 SevenZip.ShellExtension.dll

if %errorLevel% == 0 (
    echo.
    echo SUCCESS: 7-Zip Shell Extension registered successfully!
    echo You may need to restart Windows Explorer or reboot for changes to take effect.
) else (
    echo.
    echo ERROR: Registration failed
    echo Please check that:
    echo - The DLL was built successfully
    echo - All dependencies are available
    echo - You have sufficient permissions
)

echo.
pause
