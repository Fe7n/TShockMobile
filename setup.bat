@echo off
set /p path=<MSBuildPath.txt
:menu
set mode=nul
cls
echo all //.. Build 2 projects, clean and release in /MobileServer!
echo srv //.. Build TerrariaServerAPI
echo shk //.. Build TShockAPI
echo rls //.. Release in \MobileServer!
echo run //.. Run \MobileServer\TerrariaServer.exe with DEBUG.wld
echo exit/off
set /p mode= Enter command:
cls
if "%mode%"=="all" goto all
if "%mode%"=="srv" goto srv
if "%mode%"=="shk" goto shk
if "%mode%"=="rls" goto rls
if "%mode%"=="run" goto debug
if "%mode%"=="un" goto debug
if "%mode%"=="exit" goto exit
if "%mode%"=="off" goto exit
echo "Invalid input"
echo ...
pause >nul
goto menu

:debug
if not exist MobileServer goto relf
cd MobileServer
if not exist DEBUG\DEBUG.wld (
mkdir DEBUG
copy ..\DEBUG\DEBUG.wld DEBUG\DEBUG.wld /y
cls
echo DEBUG directory created...
pause >nul
)
TerrariaServer.exe -port 7777 -world DEBUG\DEBUG.wld
cls
cd ..\
goto menu
:relf
echo You need a release before you can use this command!
echo ...
pause >nul
goto menu

:all
echo Press any key to Build all projects and pack the Release!
echo ...
pause >nul

:srv
RMDIR /S /Q TerrariaServerAPI\TerrariaServerAPI\bin
%path% TerrariaServerAPI\TerrariaServerAPI\TerrariaServerAPI.csproj /t:rebuild
if "%mode%"=="all" goto shk
echo ...
pause >nul
goto menu

:shk
if not exist TerrariaServerAPI\TerrariaServerAPI\bin goto bsapif
RMDIR /S /Q TShockAPI\bin
%path% TShockAPI\TShockAPI.csproj /t:rebuild
if not "%mode%"=="all" goto shka
echo Press any key to continue!
pause >nul
goto rls
:shka
echo ...
pause >nul
goto menu
:bsapif
echo You need to build TerrariaServerAPI before you can use this command!
echo ...
pause >nul
goto menu


:rls
if not exist TShockAPI\bin goto btapif
RMDIR /S /Q MobileServer
mkdir MobileServer
mkdir MobileServer\ServerPlugins
mkdir MobileServer\Worlds
%systemroot%\System32\robocopy PB\ MobileServer /E
move TShockAPI\bin\Debug\BCrypt.Net.dll MobileServer\ServerPlugins
move TShockAPI\bin\Debug\HttpServer.dll MobileServer\ServerPlugins
move TShockAPI\bin\Debug\Mono.Data.Sqlite.dll MobileServer\ServerPlugins
move TShockAPI\bin\Debug\MySql.Data.dll MobileServer\ServerPlugins
move TShockAPI\bin\Debug\TShockAPI.dll MobileServer\ServerPlugins
move TShockAPI\bin\Debug\Newtonsoft.Json.dll MobileServer
move TShockAPI\bin\Debug\OTAPI.dll MobileServer
move TShockAPI\bin\Debug\TerrariaServer.exe MobileServer
echo Release cleanup complete!
echo ...
pause >nul
goto menu
:btapif
echo You need to build TShockAPI before you can use this command!
echo ...
pause >nul
goto menu

:exit
exit