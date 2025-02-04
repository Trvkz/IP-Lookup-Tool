@echo off
chcp 65001
title IP Lookup Tool ~ By Trakz
color 4
:menu
cls
echo ██╗██████╗     ██╗      ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██████╗ 
echo ██║██╔══██╗    ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗
echo ██║██████╔╝    ██║     ██║   ██║██║   ██║█████╔╝ ██║   ██║██████╔╝
echo ██║██╔═══╝     ██║     ██║   ██║██║   ██║██╔═██╗ ██║   ██║██╔═══╝ 
echo ██║██║         ███████╗╚██████╔╝╚██████╔╝██║  ██╗╚██████╔╝██║     
echo ╚═╝╚═╝         ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝     

echo ================== By Trakz ~ github.com/trvkz ===================
echo 1) Ip Geo Lookup
echo 2) Exit
echo ==================================================================

set /p choice=Enter your choice:

if "%choice%"=="" goto menu
if "%choice%"=="1" goto ip_geo_lookup
if "%choice%"=="2" exit

:ip_geo_lookup
cls
echo ███████╗███╗   ██╗████████╗███████╗██████╗     ██╗██████╗ 
echo ██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║██╔══██╗
echo █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║██████╔╝
echo ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║██╔═══╝ 
echo ███████╗██║ ╚████║   ██║   ███████╗██║  ██║    ██║██║     
echo ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝
echo.==========================================================
echo Enter an IP address to lookup (or type BACK to return to the main menu):
set /p ip=

if /i "%ip%"=="back" goto menu

where curl >nul 2>nul
if errorlevel 1 (
    echo Error: curl is not installed on your system.
    pause
    goto ip_geo_lookup
)

curl -k "https://ipinfo.io/%ip%/json" -o geolocation.json

findstr /i "error" geolocation.json >nul
if errorlevel 1 (
    echo ==========================================================
    echo IP Geolocation for %ip%:
    type geolocation.json
    del geolocation.json
) else (
    echo ==========================================================
    echo Error: Could not retrieve information for IP %ip%.
    del geolocation.json
)

echo ==========================================================
pause
goto ip_geo_lookup
