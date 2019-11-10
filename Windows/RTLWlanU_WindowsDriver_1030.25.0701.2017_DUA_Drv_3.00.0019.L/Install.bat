@echo off
PUSHD %CD%
cd /d %~dp0
Setup.exe /s /f2"c:\setup.log"
popd