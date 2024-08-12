@echo off
setlocal enabledelayedexpansion

:: Check if "Delete" folder exists, if not create it
if not exist "Delete" mkdir "Delete"

:: Create a temporary file to store processed filenames
set "processed_files=%temp%\processed_files.txt"
if exist "%processed_files%" del "%processed_files%"

:: Get the total number of files in the current directory
set /a total_files=0
set /a processed_count=0
for %%F in (*) do (
    if not "%%~nxF"=="%~nx0" set /a total_files+=1
)

:loop
:: Randomly select a file that hasn't been processed yet
set "file="
for /L %%i in (1,1,%total_files%) do (
    set /a random_num=!random! %% total_files + 1
    set /a current=0
    for %%F in (*) do (
        if not "%%~nxF"=="%~nx0" (
            set /a current+=1
            if !current! equ !random_num! (
                findstr /i /c:"%%F" "%processed_files%" >nul
                if errorlevel 1 (
                    set "file=%%F"
                    goto :found
                )
            )
        )
    )
)

:: If no unprocessed file is found, exit the loop
if not defined file goto :end

:found
:: Open the file with its associated application
start "" "!file!"

:: Wait for 3 seconds
timeout /t 3 /nobreak > nul

:: Close the opened file
taskkill /F /IM notepad.exe > nul 2>&1
taskkill /F /IM wordpad.exe > nul 2>&1
taskkill /F /IM Microsoft.Photos.exe > nul 2>&1
taskkill /F /IM Photos.exe
:: Add more application names if needed

:: Ask user if they want to keep the file
choice /C YN /M "Would you like to keep this file (!file!)?"

if errorlevel 2 (
    move "!file!" "Delete"
    echo File moved to Delete folder.
) else (
    echo File skipped.
)

:: Mark the file as processed
echo !file!>>"%processed_files%"

:: Increment the processed count
set /a processed_count+=1

:: Continue if there are still files to process
if %processed_count% lss %total_files% goto :loop

:end
echo All files have been processed.
del "%processed_files%"
pause