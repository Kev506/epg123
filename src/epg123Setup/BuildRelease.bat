@ECHO OFF
CLS

SETLOCAL ENABLEEXTENSIONS
SET COMPILER=C:\Program Files\Inno Setup 7\iscc.exe
SET BASE=..\..\bin\output
SET PORTABLE=%BASE%\portable
SET SETUP=%BASE%\setup
SET RELEASE=..\..\bin\Release\net10.0-windows10.0.26100.0

ECHO Clearing last build contents ...
RD /S /Q "%PORTABLE%"
MD "%PORTABLE%"
RD /S /Q "%SETUP%"
MD "%SETUP%"

ECHO Creating installation package ...
CHOICE /c yn /m "Do you wish to sign the installer"
IF ERRORLEVEL==2 "%COMPILER%" /Qp "epg123InnoSetupScript.iss"
IF ERRORLEVEL==1 "%COMPILER%" /Qp "epg123InnoSetupScript.iss" /DSIGN_INSTALLER

ECHO Copying release files to portable folder ...
COPY /Y "%RELEASE%\*.exe" "%PORTABLE%"
COPY /Y "%RELEASE%\*.dll" "%PORTABLE%"
COPY /Y "%RELEASE%\*.dll.config" "%PORTABLE%"
COPY /Y "%RELEASE%\*.deps.json" "%PORTABLE%"
COPY /Y "%RELEASE%\*.runtimeconfig.json" "%PORTABLE%"
IF EXIST "%RELEASE%\runtimes" XCOPY "%RELEASE%\runtimes" "%PORTABLE%\runtimes" /E /I /Y
COPY /Y "docs\license.rtf" "%PORTABLE%"

SET /P VER=Enter version number for zip files:

ECHO Creating zip file for installation package ...
DEL "%BASE%\epg123Setup_v%VER%.zip"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('%SETUP%', '%BASE%\epg123Setup_v%VER%.zip'); }"

ECHO Creating zip file for portable package ...
DEL "%BASE%\epg123_v%VER%.zip"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('%PORTABLE%', '%BASE%\epg123_v%VER%.zip'); }"

