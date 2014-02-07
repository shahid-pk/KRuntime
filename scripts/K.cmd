@Echo OFF
:: K [command] [args]
::   command :  Required - Name of the command to execute
::   args : Optional - Any further args will be passed directly to the command.

:: e.g. To compile the app in the current folder:
::      C:\src\MyApp\>K build

SETLOCAL

SET ERRORLEVEL=

SET TARGET=%TARGET_FRAMEWORK%
SET HOST_BIN=..\bin\Debug

if "%TARGET%" == "" (
   SET TARGET=..\src\Microsoft.Net.Project\bin\Debug\net45
)

IF EXIST "%~dp0k-%1.cmd" (
  "%~dp0k-%1.cmd" %2 %3 %4 %5 %6 %7 %8 %9 
) ELSE (
  CALL "%~dp0KLR" "%~dp0%TARGET%;%~dp0%HOST_BIN%" "Microsoft.Net.Project" %*
)

exit /b %ERRORLEVEL%

ENDLOCAL