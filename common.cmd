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
