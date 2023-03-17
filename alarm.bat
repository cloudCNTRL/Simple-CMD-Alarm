@echo off
color a
::code by Yang Si Iy Ou aka cloudCTRL
title SIMPLE CMD alarm

set alarmTone="tone.vbs"
set alarmTimeReached=false
set /a timeout=3
set /a snoozeCount=0
::max snooze count=7
:Prompt
echo.
set /p alarmTime="enter alarm time in example format [19:00] : "
set /p repeatTimes="how many times do you want the alarm to repeat before stopping ? : "

if alarmTime EQU "" (
    cls
    goto Prompt
)

:CheckTime
echo.
echo [+] WAITING FOR ALARM TO TRIGGER AT [%alarmTime%] ^| CURRENT TIME [%time%]
echo %time% >time.txt

type time.txt | findstr %alarmTime%

if %errorlevel% GTR 0 (
    cls
    goto CheckTime
) ELSE (
    set alarmTimeReached=true
    cls

    %alarmTone%
    timeout /t %timeout% /nobreak
    Call :Repeat
    
)

:Repeat
if %snoozeCount% LSS %repeatTimes% (
    echo.
    echo [+] execution [%snoozeCount%/%repeatTimes%]! Will Terminate When %repeatTimes% Is Reached
    set /a snoozeCount=%snoozeCount% + 1
    %alarmTone%
    timeout /t %timeout% /nobreak
    Call :Repeat
) ELSE (

    DEL /Q time.txt
    exit
)
