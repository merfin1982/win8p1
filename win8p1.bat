@ECHO OFF
:: Copyright © 2013 Danijel James
:: 
:: Permission is hereby granted, free of charge, to any person obtaining a copy of
:: this software and associated documentation files (the "Software"), to deal in
:: the Software without restriction, including without limitation the rights to
:: use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
:: the Software, and to permit persons to whom the Software is furnished to do so,
:: subject to the following conditions:
:: 
:: The above copyright notice and this permission notice shall be included in all
:: copies or substantial portions of the Software.
:: 
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
:: FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
:: COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
:: IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
:: CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
:: ==============================================================::
REM Version number
if "%VERSION%" == "" (
    set VERSION=0.0.1-beta
)
REM Set color to Terminal
COLOR 0A
:: ==============================================================::
:mainmenu
cls
ECHO.
ECHO.
ECHO.    Windows 8.1 Updating Script %VERSION%
ECHO.
ECHO     Copyright (c) 2013 Danijel James
ECHO.             MIT License          
ECHO.
ECHO.
ECHO.     [OPTIONS]
ECHO.
ECHO.       Download Req Files    [1]
ECHO.
ECHO.       Download 8.1 ISO      [2]
ECHO.
ECHO.
ECHO.       exit                  [X]
ECHO.
set /p choice=Enter selection:
IF %choice% EQU 1 (
	GOTO:dlfilesmenu
)
IF %choice% EQU 2 (
	GOTO:dlisomenu
)
IF %choice% EQU X (
	GOTO:baiz
)
IF %choice% EQU x (
	GOTO:baiz
) ELSE (
	(ECHO.) & (ECHO.) & (ECHO. Select [1] or [2] ONLY) & PAUSE & GOTO:mainmenu
)
:: ==============================================================::
:dlfilesmenu
ECHO.
ECHO.   *******************************************
ECHO.   *          ! ! W A R N I N G ! !          *
ECHO.   *******************************************
ECHO.   *** THIS WILL AUTO-RESTART THE COMPUTER ***
ECHO.   *******************************************
ECHO.
ECHO.
ECHO.
ECHO.   [Install KB2871389]
ECHO.
ECHO.     Windows (x64)           [1]
ECHO.
ECHO.     Windows (x32)           [2]
ECHO.
ECHO.
ECHO.     Return to menu          [0]
ECHO.
ECHO.
ECHO.   *******************************************
ECHO.   *          ! ! W A R N I N G ! !          *
ECHO.   *******************************************
ECHO.   *** THIS WILL AUTO-RESTART THE COMPUTER ***
ECHO.   *******************************************
ECHO.
set /p runbot=Enter selection:
IF %runbot% EQU 1 (
	
)
IF %runbot% EQU 2 (
	
)
IF %runbot& EQU 0 (
	GOTO:mainmenu
) ELSE (
	(ECHO.) & (ECHO.) & (ECHO. Select [1] or [2] ONLY) & PAUSE & GOTO:dlfilesmenu
)
































:: ==============================================================::
:baiz
ECHO.
ECHO.
ECHO.
ECHO.            BYE!
ping -n 3 127.0.0.1
exit