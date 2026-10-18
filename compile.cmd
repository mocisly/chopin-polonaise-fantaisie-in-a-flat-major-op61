@echo off
setlocal
cd /d "%~dp0"
where lilypond >nul 2>&1
if errorlevel 1 (
  echo LilyPond was not found in PATH. Install LilyPond 2.26.0 first.
  pause
  exit /b 1
)
if not exist "build" mkdir "build"
lilypond -o "build\chopin-polonaise-fantaisie-in-a-flat-major-op61" "chopin-polonaise-fantaisie-in-a-flat-major-op61.ly" >"build\compile.log" 2>&1
set "RC=%ERRORLEVEL%"
type "build\compile.log"
if not "%RC%"=="0" (
  echo Compilation failed. See build\compile.log.
) else (
  echo PDF and MIDI have been created in build.
)
pause
exit /b %RC%
