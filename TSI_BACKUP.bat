SET TSI_PATH=C:\TSI\Aerosol Instrument Manager
SET BOX_PATH=C:\Users\Administrator\Box Sync\Remote field data\Mobile Sampling Truck

SET BACKUP_FOLDER=%1
IF NOT [%1]==[] (
	SET BACKUP_FOLDER=%BACKUP_FOLDER%\TSI
)
IF [%1]==[] (
	SET BACKUP_FOLDER=%cd%
)

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
SET h=%TIME:~0,2%
SET m=%TIME:~3,2%

SET ZIP_NAME=TSI-%mydate%-%h%%m%.7z

"c:\Program Files\7-Zip\7z.exe" a "%TSI_PATH%\%ZIP_NAME%" "%TSI_PATH%\*.A21" "%TSI_PATH%\*.S80" "%TSI_PATH%\*.p80" "%TSI_PATH%\*.p21"
copy /-Y "%TSI_PATH%\%ZIP_NAME%" "%BOX_PATH%\TSI"
move /Y "%TSI_PATH%\%ZIP_NAME%" "%BACKUP_FOLDER%"
exit