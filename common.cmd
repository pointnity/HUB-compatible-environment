@echo off

set FB_ROOT="%~dp0"
set RUN_FROM=%CD%

set _SHIFTTOK=0

set _NPARAM=%~1
IF /I "%_NPARAM%"=="" goto defaults
IF /I "%_NPARAM:~0,1%"=="-" goto defaults
set PROJDIR=%1
shift
set _SHIFTTOK=1

set _NPARAM=%~1
IF /I "%_NPARAM%"=="" goto default_build
IF /I "%_NPARAM:~0,1%"=="-" goto default_build
set BUILDDIR=%1
shift
set _SHIFTTOK=2

goto finish

:defaults
set PROJDIR="%RUN_FROM%\projects"

:default_build
IF /I %PROJDIR%==examples goto examples
set BUILDDIR="%RUN_FROM%\build"
goto finish

:examples
echo Building examples
set BUILDDIR="%RUN_FROM%\buildex"

:finish
IF EXIST %PROJDIR% GOTO direxists
echo ERROR: Project directory %PROJDIR% does not exist.  usage: prep[ver].cmd [project dir] [build dir]
exit /B 2
goto end

:direxists
REM We need the full path of the directories
REM This is a hack, but it works
pushd ""%PROJDIR%"" > NUL
set PROJDIR="%CD%"
popd > NUL
mkdir ""%BUILDDIR%""
pushd ""%BUILDDIR%"" > NUL
if %errorlevel% == 1 goto error
set BUILDDIR="%CD%"
popd > NUL

for /f "tokens=%_SHIFTTOK%*" %%a in ('echo.%*') do set CMAKE_PARAMS=%%b
goto finished

:error
