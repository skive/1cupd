@echo off
mode con cp select=1251>nul
call %~dp0setEnvironment.bat
call notepad %basesfile%

for /F "usebackq delims=;" %%I in ("%basesfile%") do (
cls
echo Запуск %%I
"%onecexe%" ENTERPRISE /%basetype% "%server%\%%I" /AppAutoCheckMode
)