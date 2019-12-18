@echo off
set /p path=<MSBuildPath.txt
:menu
set mode=nul
cls
echo all //.. Build 2 projects, clean and release in /MobileServer!
echo srv //.. Build TerrariaServerAPI
echo shk //.. Build TShockAPI
echo rls //.. Release in /MobileServer!
echo exit //. 
set /p mode= Enter command:
cls
if "%mode%"=="all" goto all
if "%mode%"=="srv" goto srv
if "%mode%"=="shk" goto shk
if "%mode%"=="rls" goto rls
if "%mode%"=="exit" goto exit
echo "Invalid input"
echo ...
pause >nul
goto menu

:all
echo Press any key to Build all projects and pack the Release!
echo ...
pause >nul

:srv
RMDIR /S /Q TerrariaServerAPI\TerrariaServerAPI\bin\Debug
%path% TerrariaServerAPI\TerrariaServerAPI\TerrariaServerAPI.csproj /t:rebuild
if "%mode%"=="all" goto shk
echo ...
pause >nul
goto menu

:shk
RMDIR /S /Q TShockAPI\bin\Debug
%path% TShockAPI\TShockAPI.csproj /t:rebuild
if "%mode%"=="all" goto rls
echo ...
pause >nul
goto menu

:rls
RMDIR /S /Q MobileServer
mkdir MobileServer
mkdir MobileServer\ServerPlugins
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

:exit
exit
