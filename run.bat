@call ./setEnvironment.bat
@set user=%2
@set pass=%3
@set all=%4
@set needbackup=%5

@if not exist %logfolder% @md %logfolder%
@if "%user%" EQU "" @goto scriptMessage
@if "%all%" EQU "" @call notepad %basesfile%

@if "%1" == "upd" @goto Update
@if "%1" == "bak" @goto Backup
@goto scriptMessage


:Update
@echo ----------------------------------------------------
@echo ���������� ������������
@title Update All
@set logfile=%logfolder%upd-%now%.log
@call ./updateAll.bat
@goto endProcess

:Backup
@echo ----------------------------------------------------
@echo ��������� ����������� ������������
@title Backup All
@set logfile=%logfolder%bak-%now%.log
@call ./backupAll.bat
@goto endProcess

:scriptMessage
@echo ----------------------------------------------------
@echo SPECIFY bak - to backup, upd - to update (1st parameter mandatory)
@echo SPECIFY 1c admin name (2nd parameter mandatory)
@echo SPECIFY 1c admin password (3d parameter mandatory)
@echo USE all flag if need to process all bases (4th parameter not mandatory)
@echo ----------------------------------------------------
@goto endScript

:endProcess
@color 08
@echo ----------------------------------------------------
@echo ���� ����� �������
@echo YOU MAY CLOSE THE WINDOW
@echo ----------------------------------------------------
@goto endScript

:endScript
@pause


