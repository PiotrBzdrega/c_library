@ECHO OFF

gcc -c -fPIC *.c
gcc -shared -o clibrary.dll *.o

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