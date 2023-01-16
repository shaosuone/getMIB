@echo off
powershell -executionpolicy RemoteSigned -file ".\getMIB.ps1"
timeout /t 0 /nobreak
