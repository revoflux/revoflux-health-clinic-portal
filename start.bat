@echo off
setlocal EnableExtensions EnableDelayedExpansion

title HMS - Hospital Management System
color 0B
cd /d "%~dp0"

set "API_PORT=5000"
set "FRONTEND_PORT=3000"
set "NODE_OPTIONS=--dns-result-order=ipv4first"

echo.
echo  ================================================
echo   HOSPITAL MANAGEMENT SYSTEM
echo  ================================================
echo.
echo  Working folder:
echo  %CD%
echo.

if not exist "package.json" goto :NO_PROJECT

echo  [1/4] Checking Node.js...
set "NODE_EXE="
for /f "delims=" %%N in ('where node 2^>nul') do (
    if not defined NODE_EXE set "NODE_EXE=%%N"
)
if not defined NODE_EXE goto :NO_NODE
echo        [OK] !NODE_EXE!
echo.
echo  [2/4] Checking pnpm...
set "PNPM_EXE="
for /f "delims=" %%P in ('where pnpm 2^>nul') do (
    if not defined PNPM_EXE set "PNPM_EXE=%%P"
)
if not defined PNPM_EXE goto :NO_PNPM
echo        [OK] !PNPM_EXE!
echo.
echo  [3/4] Installing packages if needed...
echo        Checking and installing required packages.
echo        Do not close this window.
echo.
call pnpm install --no-frozen-lockfile
if errorlevel 1 goto :INSTALL_FAILED
echo        [OK] Packages are ready.
echo.

echo  [4/4] Building the API server...
call pnpm --filter @workspace/api-server run build
if errorlevel 1 goto :BUILD_FAILED
echo        [OK] API server build completed.
echo.

set "API_LAUNCHER=%TEMP%\hms-api-%RANDOM%.bat"
set "FRONTEND_LAUNCHER=%TEMP%\hms-frontend-%RANDOM%.bat"

rem Create temporary child launchers. The project folder still contains only hms.bat.
(
    echo @echo off
    echo title HMS - API Server
    echo color 09
    echo cd /d "%CD%"
    echo set "PORT=%API_PORT%"
    echo set "NODE_ENV=development"
    echo set "NODE_OPTIONS=--dns-result-order=ipv4first"
    echo echo.
    echo echo  HMS API Server - port %API_PORT%
    echo echo  Keep this window open while using HMS.
    echo echo.
    echo node --enable-source-maps "artifacts\api-server\dist\index.mjs"
    echo echo.
    echo echo  API server stopped. Read the error above.
    echo pause
) > "%API_LAUNCHER%"

(
    echo @echo off
    echo title HMS - Frontend
    echo color 0E
    echo cd /d "%CD%"
    echo set "PORT=%FRONTEND_PORT%"
    echo set "API_PORT=%API_PORT%"
    echo set "BASE_PATH=/"
    echo set "NODE_OPTIONS=--dns-result-order=ipv4first"
    echo echo.
    echo echo  HMS Frontend - port %FRONTEND_PORT%
    echo echo  Keep this window open while using HMS.
    echo echo.
    echo call pnpm --filter @workspace/hms run dev
    echo echo.
    echo echo  Frontend stopped. Read the error above.
    echo pause
) > "%FRONTEND_LAUNCHER%"

echo  Starting API server window...
start "HMS - API Server" "%ComSpec%" /k call "%API_LAUNCHER%"
if errorlevel 1 goto :API_WINDOW_FAILED

echo  Waiting 5 seconds for API server...
timeout /t 5 /nobreak >nul

echo  Starting frontend window...
start "HMS - Frontend" "%ComSpec%" /k call "%FRONTEND_LAUNCHER%"
if errorlevel 1 goto :FRONTEND_WINDOW_FAILED

echo  Waiting 15 seconds for frontend...
timeout /t 15 /nobreak >nul

set "LOCAL_IP=not-found"
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
    if "!LOCAL_IP!"=="not-found" set "LOCAL_IP=%%A"
)
set "LOCAL_IP=!LOCAL_IP: =!"

start "" "http://127.0.0.1:%FRONTEND_PORT%"

echo.
echo  ====================================================
echo    HOSPITAL MANAGEMENT SYSTEM - STARTED
echo  ====================================================
echo.
echo    On this PC : http://127.0.0.1:%FRONTEND_PORT%
echo    On network : http://!LOCAL_IP!:%FRONTEND_PORT%
echo.
echo    Keep both server windows open.
echo    Data is saved in the data folder as JSON files.
echo    To stop HMS, close the API and Frontend windows.
echo.
pause
exit /b 0

:NO_PROJECT
echo.
echo  [ERROR] package.json was not found.
echo  Run this file from the main hospital-management-system folder.
goto :FAILED

:NO_NODE
echo.
echo  [ERROR] Node.js was not found in PATH.
echo  Install Node.js from https://nodejs.org, then open a new Command Prompt.
goto :FAILED

:NO_PNPM
echo.
echo  [ERROR] pnpm was not found in PATH.
echo  Open a new Command Prompt after installing pnpm, then run this file again.
goto :FAILED

:INSTALL_FAILED
echo.
echo  [ERROR] Package installation failed.
echo  Read the error above, fix it, and run this file again.
goto :FAILED

:BUILD_FAILED
echo.
echo  [ERROR] API server build failed.
echo  Read the error above and run this file again.
goto :FAILED

:API_WINDOW_FAILED
echo.
echo  [ERROR] Windows could not open the API server window.
goto :FAILED

:FRONTEND_WINDOW_FAILED
echo.
echo  [ERROR] Windows could not open the frontend window.
goto :FAILED

:FAILED
echo.
echo  The launcher will stay open so you can read this message.
echo.
pause
exit /b 1
