@echo off
set ISSPath=%~dp0\Uninstall.iss
PUSHD %CD%
cd /d %~dp0
setup.exe /UNINST /removeonly /s /f1"%ISSPath%" /f2"c:\setup.log"
popd