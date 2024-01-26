u/echo off

setlocal

rem Backup script by bates121

rem set the temp file name and path

set tmpfile="M:\yourbackup\location\lubelogger\temp.txt"



rem make an API call and save the output to the temp file

curl -n -u "rootuser":"rootpassword" --location "https://lubelogger.yourcooldomain.com/api/makebackup" -o %tmpfile%



rem read the content of the temp file and assign it to result

for /f "delims=" %%a in ('type %tmpfile%') do set result=%%a



rem set the domain name

set domain="https://lubelogger.yourcooldomain.com"



rem concatenate the domain and result, and assign it to newurl

set newurl=%domain%%result%



rem download the backup file and save it to the backup folder

curl -n --location %newurl% -o "M:\yourbackup\location\lubelogger\backup.zip"

rem add _YYYYMMDD to filename

set datestamp=%date:~10,4%%date:~4,2%%date:~7,2%

ren "M:\yourbackup\location\lubelogger\backup.zip" "backup_%datestamp%.zip"

rem delete the temp file

del /f /q /d %tmpfile%



endlocal

pause /b