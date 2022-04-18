@ECHO OFF

SET PATH=%~dp0python3\;%~dp0python3\Scripts\;%~dp0utils\;%PATH%

@REM FOR /F "tokens=* USEBACKQ" %%F IN (`python utils/getdate.py`) DO (
@REM SET TEST_DATETIME=%%F
@REM )

SET TEST_DATETIME=default
SET TEST_DIR=%~dp0robot_projects

robot -d .\logs\%TEST_DATETIME% --variable RESOURCE_DIR:%~dp0resources %TEST_DIR%\*