@echo off
title Visor 360 Dron RTK
cd /d "%~dp0"
echo Iniciando el servidor local y abriendo el visor en tu navegador...
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0server.ps1"
pause
