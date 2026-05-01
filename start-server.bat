@echo off
REM PillowCreate launcher. Place on Desktop or anywhere convenient.
REM Requires: Docker Desktop running with WSL2 integration enabled.

wsl -e bash -c "cd /home/lance/minecraft/pillowcreate && docker compose up -d"
if errorlevel 1 (
  echo.
  echo Failed to start. Common causes:
  echo   1. Docker Desktop is not running.
  echo   2. WSL integration is off. Open Docker Desktop -^> Settings -^>
  echo      Resources -^> WSL Integration -^> enable for your distro.
  pause
  exit /b 1
)

echo.
echo PillowCreate started. Tail logs with:
echo   wsl -e bash -c "cd /home/lance/minecraft/pillowcreate && docker compose logs -f"
echo.
echo Stop with: stop-server.bat
pause
