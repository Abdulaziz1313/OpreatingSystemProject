@echo off
C:
CD\

:MENU
CLS

echo :: Press 1,2 or 3 etc, to select your task, or 9 to EXIT.
echo==========================================================
echo 1 - Display User/PC Info
ECHO --------------------------------------
echo 2 - Check/Create Directory Structure 
ECHO --------------------------------------
echo 3 - Create Logfile 
ECHO --------------------------------------
echo 4 - Backup Logfile 
ECHO --------------------------------------
echo 5 - File Comparison 
ECHO --------------------------------------
echo 6 - View File Attributes 
ECHO --------------------------------------
echo 7 - View Folder Permissions 
ECHO --------------------------------------
echo 8 - List Non-System Processes
ECHO --------------------------------------

echo 9 - Exit

ECHO --------------------------------------




set input=
set /p input="Please select one of the following : " 

if /I '%input%'=='1' GOTO Selection1
if /I '%input%'=='2' GOTO Selection2
if /I '%input%'=='3' GOTO Selection3
if /I '%input%'=='4' GOTO Selection4
if /I '%input%'=='5' GOTO Selection5
if /I '%input%'=='6' GOTO Selection6
if /I '%input%'=='7' GOTO Selection7
if /I '%input%'=='8' GOTO Selection8 
if /I '%input%'=='9' GOTO Selection9

CLS

ECHO===========INVALID INPUT============
ECHO ------------------------------------
ECHO Please select a number from the menu
echo [1-9]
echo=====PRESS ANY KEY TO CONTINUE======

PAUSE>NUL
goto menu 

:Selection1 

:: This option displays a "Hello" message along with the users username, computername, time and date. 

echo HELLO %username%, you are currently logged into %computername%.
echo It is %time% on %date%.
PAUSE

GOTO MENU

:Selection2

:: This option checks if C:\batch\logs and C:\backup\logs exists and if so states they exist.

if exist C:\batch\logs (echo It is already created), else (MD C:\batch\logs)
if exist C:\backup\logs (echo It is alreddy created), else (MD C:\backup\logs)
echo both files have been created.
PAUSE


goto menu

:Selection3

:: This option checks for logfile and if not found states it is creating a logfile, if found states that it is writing to current logfile.

if exist C:\Batch\Logs\logfile.txt (echo - Writing to current logfile..) else (echo - Creating a logfile..)

echo >> C:\Batch\Logs\logfile.txt
echo Hello %USERNAME%, you are currently using the PC: %USERDOMAIN% >> C:\Batch\Logs\logfile.txt
echo ^> The current time is: %TIME% >> C:\Batch\Logs\logfile.txt
echo ^> The current date is: %DATE% >> c:\Batch\Logs\logfile.txt

TIMEOUT /T 2> nul /NOBREAK
ECHO.
echo ^>^> Logfile updated.

Pause

goto menu 

:Selection4

:: This option backs up the contents of the C:\batch\logs folder to C:\backup\logs.


xcopy /s C:\batch\logs C:\backup\logs
echo Files C:\batch\logs have been copied to C:\backup\logs.

pause
 
goto menu

:Selection5

:: An option to output the difference between these two files to screen.


comp /A C:\batch\logs C:\backup\logs
pause

goto menu

:Selection6 

:: An option to view the attributes of C:\batch\logs\logfile.txt.

attrib c:\batch\logs\logfile.txt
pause

goto menu 

:Selection7

:: An option to view the permission on the folder C:\backup.

icacls C:\backup

pause

goto menu

:Selection8

:: An option to list all running, non-system processes.

tasklist /fi "USERNAME ne NT AUTHORITY\SYSTEM" /fi "STATUS eq running"
pause

goto menu 

:Selection9

:: An option to exit the script - asking to confirm before exiting.

SET /P INPUT=Close program?("Yes" or "No")
if /I '%input%'=='Yes' GOTO quit
if /I '%input%'=='No' GOTO menu

:Quit 

echo================THANK YOU============
echo -------------------------------------
echo=====PRESS ANY KEY TO CONTINUE=======

PAUSE>NUL
EXIT





