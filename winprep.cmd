@echo off

:runcmake
pushd "%BUILDDIR%" > NUL
if %errorlevel% == 1 goto builddir_error
REM ** shift off the first 2 params so the rest goes to cmake
shift
shift

set PDIR=-DFB_PROJECTS_DIR=
set PDIR=%PDIR%%PROJDIR%
