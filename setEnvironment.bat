@echo off

:: SPECIFY server as servername for SQL version 1C or full path to folder, where configs layout for Filesystem version 1c
set server=d:\1c\bases
:: SPECIFY basetype = {F - filesystem or S - sqlserver}
set basetype=F

set logfolder=[specify\log\folder]
set backupfolder=[specify\backups\folder]
set cloudfolder=[specify/cloud/folder]
set updtsdir=[specify\updates\folder]

:: IN UPDATE list use ONLY version exmpl 3_0_49_21
set updtfile=%~dp0updates.list
set basesfile=%~dp0bases.list
set uploadlistfile=%~dp0upload.list

set onecexe=[specify\path\to\1cv8.exe]
set java=java.exe
set zu=%~dp0ZullusaUploader.jar

set needbackup=1
set needUploadToCloud=0
set olderdays=100

set smtp=[smtp.server]
set port=[smtp_port]
set mail_to=[mail@to]
set mail_from=[mail@from]
set logMail=%logfolder%sendmail.log
set smtp_user=[smtp-user]
set smtp_pass=[smtp-pass]

set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do @set now=%%c%%b%%a_%%d%%e

set log1cfile=%logfolder%1cAll-%now%.log
set logfile=%logfolder%all%now%.log



:: SPECIFY All available bases, for first name use one character ">"
echo base1;>%basesfile%
echo base2;>>%basesfile%
