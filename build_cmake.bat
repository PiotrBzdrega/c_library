@ECHO OFF


:MENU
ECHO.
ECHO Choose a build configuration:
ECHO 1. Debug
ECHO 2. Release
ECHO.

SET /P "CONFIG=Enter your choice (1 or 2): "

IF "%CONFIG%"=="1" (
    SET BUILD_TYPE=Debug
) ELSE IF "%CONFIG%"=="2" (
    SET BUILD_TYPE=Release
) ELSE (
    ECHO Invalid choice. Please enter 1 or 2.
    GOTO MENU
)


mkdir build
cd build
cmake ..
cmake --build . --target ALL_BUILD --config %BUILD_TYPE%
cd %BUILD_TYPE%


REM Set the path to the Visual Studio installation directory
SET "VS_PATH=C:\Program Files\Microsoft Visual Studio\2022\Community"

REM Check if VsDevCmd.bat exists
IF EXIST "%VS_PATH%\Common7\Tools\VsDevCmd.bat" (
    CALL "%VS_PATH%\Common7\Tools\VsDevCmd.bat"
REM    ECHO Developer Command Prompt for Visual Studio has been started.
	ECHO Current path:%CD%
REM	timeout /nobreak /t 5 >nul
	dumpbin /exports clibrary.dll
) ELSE (
    ECHO VsDevCmd.bat not found. dumpbin of .dll won't be displayed.
)
PAUSE