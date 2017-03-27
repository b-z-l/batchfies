SET RTOCEC_PATH=C:\RTOCEC_Instrument_Software\Rawdata\MobileLab
SET BOX_PATH=C:\Users\Administrator\Box Sync\Remote field data\Mobile Sampling Truck

IF NOT [%1]==[] (
	SET BACKUP_FOLDER=%BACKUP_FOLDER%\RTOCEC
)
IF [%1]==[] (
	SET BACKUP_FOLDER=%cd%
)

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
SET h=%TIME:~0,2%
SET m=%TIME:~3,2%

SET ZIP_NAME=RTOCEC-%mydate%-%h%%m%.7z

"c:\Program Files\7-Zip\7z.exe" a "%RTOCEC_PATH%\%ZIP_NAME%" "%RTOCEC_PATH%\*.txt"
copy /-Y "%RTOCEC_PATH%\%ZIP_NAME%" "%BOX_PATH%\RTOCEC"
move /Y "%RTOCEC_PATH%\%ZIP_NAME%" "%BACKUP_FOLDER%"
if %errorlevel%==0 (
	exit
)
