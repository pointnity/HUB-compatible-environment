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
