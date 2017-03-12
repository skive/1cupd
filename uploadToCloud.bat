@set uploadlogfile=./zu.log

@if not exist %1 @goto errorMessage
@color 4e
@echo ----------------------------------------------------
@echo     ,    
@echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
@echo ----------------------------------------------------
@powershell get-date -format g >> %uploadlogfile%
@echo Check destination dropbox.com>>%uploadlogfile%
:pingOneMore
@ping dropbox.com -n 1 | find "­Ľ ă¤ ŤŽáě">>%uploadlogfile%
@if %ERRORLEVEL% EQU 0 @goto pingOneMore>>%uploadlogfile%
@powershell get-date -format g >> %uploadlogfile%
@echo Copy arc to cloud>>%uploadlogfile%
@echo %java%>>%uploadlogfile%
@for /F "usebackq delims=;" %%i in ("%1") do (
	@%java% -jar %zu% uf "./auth.sec" %%i>>%uploadlogfile%
	@powershell get-date -format g >> %uploadlogfile%
)
@del %1>> %uploadlogfile%
@goto endProcedure

:errorMessage
@powershell get-date -format g >> %uploadlogfile%
@echo File "%1" not found. See 1c log>>%uploadlogfile%
@goto endProcedure

:cmdMessage
@echo ----------------------------------------------------
@echo Ű   USE run.bat with params                        Ű
@echo Ű         "bak"                                    Ű
@echo Ű         1c admin name                            Ű
@echo Ű         1c admin password                        Ű
@echo ----------------------------------------------------
@pause


:endProcedure
@color 08
@echo ----------------------------------------------------
@echo   
@echo YOU MAY CLOSE THE WINDOW
@echo ----------------------------------------------------