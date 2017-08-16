@echo off

Setlocal EnableDelayedExpansion

rem Setup environment
call "%~dp0env.bat" %1 %2 %3

rem Define path to project file
set "PRJFILE=%~dp0\CSharp.sln"

set "VisualStudioExpressName=VCExpress"

if /I "%VCVER%" == "vc10" (
  set "DevEnvDir=%VS100COMNTOOLS%..\IDE"
) else if /I "%VCVER%" == "vc11" (
  set "DevEnvDir=%VS110COMNTOOLS%..\IDE"
  rem Visual Studio Express starting from VS 2012 is called "for Windows Desktop"
  rem and has a new name for executable - WDExpress
  set "VisualStudioExpressName=WDExpress"
) else if /I "%VCVER%" == "vc12" (
  set "DevEnvDir=%VS120COMNTOOLS%..\IDE"
  set "VisualStudioExpressName=WDExpress"
) else if /I "%VCVER%" == "vc14" (
  set "DevEnvDir=%VS140COMNTOOLS%..\IDE"
  set "VisualStudioExpressName=WDExpress"
) else (
  echo Error: wrong VS identifier
  exit /B
)


  start "%DevEnvDir%\devenv.exe" "%PRJFILE%"
