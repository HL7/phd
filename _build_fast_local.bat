@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "PUBLISHER_JAR=publisher.jar"
set "INPUT_CACHE_PATH=%CD%\input-cache"
set "UPPER_PATH=%CD%\.."

set "JAR_LOCATION="
if exist "%INPUT_CACHE_PATH%\%PUBLISHER_JAR%" set "JAR_LOCATION=%INPUT_CACHE_PATH%\%PUBLISHER_JAR%"
if not defined JAR_LOCATION if exist "%UPPER_PATH%\%PUBLISHER_JAR%" set "JAR_LOCATION=%UPPER_PATH%\%PUBLISHER_JAR%"

if not defined JAR_LOCATION (
  echo IG Publisher NOT FOUND in input-cache or parent folder. Run _updatePublisher.bat first.
  exit /b 1
)

set "REQUEST_FILE=publication-request.json"
set "REQUEST_BACKUP=%REQUEST_FILE%.fast-local.bak"
set "RESTORE_REQUEST=false"
set "IGNORE_FILE=input\ignoreWarnings.txt"
set "IGNORE_FAST_FILE=input\ignoreWarnings-fast-local.txt"
set "IGNORE_BACKUP=%IGNORE_FILE%.fast-local.bak"
set "RESTORE_IGNORE=false"
set "TX_ARGS=-tx n/a -no-network"

if /I "%~1"=="tx" (
  set "TX_ARGS="
  shift
) else if /I "%~1"=="--tx" (
  set "TX_ARGS="
  shift
) else if /I "%~1"=="notx" (
  shift
) else if /I "%~1"=="--notx" (
  shift
)

rem The publication request triggers previous-version comparison, which is slow for local iteration.
if exist "%REQUEST_FILE%" (
  move /Y "%REQUEST_FILE%" "%REQUEST_BACKUP%" >nul
  if errorlevel 1 (
    echo Failed to prepare fast local build. Could not move %REQUEST_FILE%.
    exit /b 1
  )
  set "RESTORE_REQUEST=true"
)

rem Fast local builds can use a broader ignore list for known terminology-related QA noise.
if exist "%IGNORE_FAST_FILE%" if exist "%IGNORE_FILE%" (
  copy /Y "%IGNORE_FILE%" "%IGNORE_BACKUP%" >nul
  if errorlevel 1 (
    echo Failed to back up %IGNORE_FILE% for fast local build.
    exit /b 1
  )
  copy /Y "%IGNORE_FAST_FILE%" "%IGNORE_FILE%" >nul
  if errorlevel 1 (
    echo Failed to apply %IGNORE_FAST_FILE% for fast local build.
    if exist "%IGNORE_BACKUP%" copy /Y "%IGNORE_BACKUP%" "%IGNORE_FILE%" >nul
    exit /b 1
  )
  set "RESTORE_IGNORE=true"
)

if defined TX_ARGS (
  echo Running fast local build (no tx, no network, skip previous-version comparison)
) else (
  echo Running fast local build (with tx, skip previous-version comparison)
)
java %JAVA_OPTS% -Dfile.encoding=UTF-8 -jar "%JAR_LOCATION%" -ig . %TX_ARGS% %*
set "BUILD_EXIT=%ERRORLEVEL%"

if /I "%RESTORE_REQUEST%"=="true" (
  if exist "%REQUEST_BACKUP%" (
    move /Y "%REQUEST_BACKUP%" "%REQUEST_FILE%" >nul
  )
)

if /I "%RESTORE_IGNORE%"=="true" (
  if exist "%IGNORE_BACKUP%" (
    copy /Y "%IGNORE_BACKUP%" "%IGNORE_FILE%" >nul
    del /Q "%IGNORE_BACKUP%" >nul 2>nul
  )
)

exit /b %BUILD_EXIT%
