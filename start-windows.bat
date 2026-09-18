@echo off
cd /d "%~dp0"
start "Chihna Local Server" /min py -m http.server 8765 --bind 127.0.0.1
timeout /t 2 /nobreak >nul
start "" "http://localhost:8765/bangla-troll-annotator.html"
