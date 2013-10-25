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
    set VERSION=0.1.1-2
)
REM Set color to Notice
COLOR 04
:: ==============================================================::
IF exist %USERPROFILE%\download.vbs (
	GOTO:mainmenu
) ELSE (
	ECHO.
	ECHO.
	ECHO.    Making preparations.
	ping -n 2 127.0.0.1 >nul
	cls
	ECHO.
	ECHO.
	ECHO.    Making preparations..
	ping -n 2 127.0.0.1 >nul
	cls
	ECHO.
	ECHO.
	ECHO.    Making preparations...
	ping -n 2 127.0.0.1 >nul
	cls
	echo Option Explicit                                                    >  %USERPROFILE%\download.vbs
	echo Dim args, http, fileSystem, adoStream, url, target, status         >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	echo Set args = Wscript.Arguments                                       >> %USERPROFILE%\download.vbs
	echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1")              >> %USERPROFILE%\download.vbs
	echo url = args(0)                                                      >> %USERPROFILE%\download.vbs
	echo target = args(1)                                                   >> %USERPROFILE%\download.vbs
	echo WScript.Echo "Getting '" ^& target ^& "' from '" ^& url ^& "'..."  >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	echo http.Open "GET", url, False                                        >> %USERPROFILE%\download.vbs
	echo http.Send                                                          >> %USERPROFILE%\download.vbs
	echo status = http.Status                                               >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	echo If status ^<^> 200 Then                                            >> %USERPROFILE%\download.vbs
	echo    WScript.Echo "FAILED to download: HTTP Status " ^& status       >> %USERPROFILE%\download.vbs
	echo    WScript.Quit 1                                                  >> %USERPROFILE%\download.vbs
	echo End If                                                             >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	echo Set adoStream = CreateObject("ADODB.Stream")                       >> %USERPROFILE%\download.vbs
	echo adoStream.Open                                                     >> %USERPROFILE%\download.vbs
	echo adoStream.Type = 1                                                 >> %USERPROFILE%\download.vbs
	echo adoStream.Write http.ResponseBody                                  >> %USERPROFILE%\download.vbs
	echo adoStream.Position = 0                                             >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	echo Set fileSystem = CreateObject("Scripting.FileSystemObject")        >> %USERPROFILE%\download.vbs
	echo If fileSystem.FileExists(target) Then fileSystem.DeleteFile target >> %USERPROFILE%\download.vbs
	echo adoStream.SaveToFile target                                        >> %USERPROFILE%\download.vbs
	echo adoStream.Close                                                    >> %USERPROFILE%\download.vbs
	echo.                                                                   >> %USERPROFILE%\download.vbs
	REM Set color to Terminal
	COLOR 0A
	GOTO:mainmenu
)
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
ECHO.       Auto Windows Updates     [1]
ECHO.
ECHO.       Download 8.1 ISO         [2]
ECHO.
ECHO.
ECHO.       Exit                     [X]
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
ECHO.   ******************************************
ECHO.   *          ! ! W A R N I N G ! !         *
ECHO.   ******************************************
ECHO.   *** THIS MAY AUTO-RESTART THE COMPUTER ***
ECHO.   ******************************************
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
ECHO.   ******************************************
ECHO.   *          ! ! W A R N I N G ! !         *
ECHO.   ******************************************
ECHO.   *** THIS MAY AUTO-RESTART THE COMPUTER ***
ECHO.   ******************************************
ECHO.
set /p runbot=Enter selection:
IF %runbot% EQU 1 (
	cscript //Nologo %USERPROFILE%\download.vbs http://download.microsoft.com/download/6/7/B/67BB1487-B67A-4B3C-BF49-140AB1CF7B5F/Windows8-RT-KB2871389-x64.msu %USERPROFILE%\Windows8-RT-KB2871389-x64.msu
	GOTO:x64inst
)
IF %runbot% EQU 2 (
	cscript //Nologo %USERPROFILE%\download.vbs http://download.microsoft.com/download/0/C/6/0C67F34D-1F09-429D-B55E-794177982162/Windows8-RT-KB2871389-x86.msu %USERPROFILE%\Windows8-RT-KB2871389-x86.msu
	GOTO:x86inst
)
IF %runbot% EQU 0 (
	GOTO:mainmenu
) ELSE (
	(ECHO.) & (ECHO.) & (ECHO. Select [1] or [2] ONLY) & PAUSE & GOTO:dlfilesmenu
)
:: ==============================================================::
:x64inst
IF exist "%USERPROFILE%\Windows8-RT-KB2871389-x64.msu" (
	wusa.exe %USERPROFILE%\Windows8-RT-KB2871389-x64.msu /quiet
	goto:letuknow
) ELSE (
	cls
	ECHO.
	ECHO.
	ECHO. Download not finished, checking in 30 seconds...
	ping -n 30 127.0.0.1 >nul
	GOTO:x64inst
)
:: ==============================================================::
:x86inst
IF exist "%USERPROFILE%\Windows8-RT-KB2871389-x86.msu" (
	wusa.exe %USERPROFILE%\Windows8-RT-KB2871389-x86.msu /quiet
	goto:letuknow
) ELSE (
	cls
	ECHO.
	ECHO.
	ECHO. Download not finished, checking in 30 seconds...
	ping -n 30 127.0.0.1 >nul
	GOTO:x86inst
)
:: ==============================================================::
:letuknow
cls
ECHO.
ECHO.
ECHO.    Your computer may restart automatically, if this does
ECHO.    not happen automatically, it will go back to the main
ECHO.    menu in approximately 1 min and you may proceed with
ECHO.    download of Windows 8.1 ISO file or choose to use the
ECHO.    Windows Store to complete the upgrade.
ECHO.
ping -n 2 127.0.0.1 >nul
cls
ECHO.
ECHO.
ECHO.    Your computer may restart automatically, if this does
ECHO.    not happen automatically, it will go back to the main
ECHO.    menu in approximately 1 min and you may proceed with
ECHO.    download of Windows 8.1 ISO file or choose to use the
ECHO.    Windows Store to complete the upgrade..
ECHO.
ping -n 2 127.0.0.1 >nul
cls
ECHO.
ECHO.
ECHO.    Your computer may restart automatically, if this does
ECHO.    not happen automatically, it will go back to the main
ECHO.    menu in approximately 1 min and you may proceed with
ECHO.    download of Windows 8.1 ISO file or choose to use the
ECHO.    Windows Store to complete the upgrade...
ECHO.
ping -n 60 127.0.0.1 >nul
GOTO:mainmenu
:: ==============================================================::
:dlisomenu
cls
ECHO.
ECHO.
ECHO.     Download Win8.1 ISO Maker       [1]
ECHO.
ECHO.
ECHO.     Return to menu                  [0]
ECHO.
set /p catman=Enter choice:
IF %catman% EQU 1 (
	cscript //Nologo %USERPROFILE%\download.vbs  http://web.esd.microsoft.com/W81GA/81GF9D695DA9DF8D56B2BC5B7356B5DA9D89D29D69/WindowsSetupBox.exe %USERPROFILE%\WindowsSetupBox.exe
	GOTO:isomake
)
IF %catman% EQU 0 (
	GOTO:mainmenu
) ELSE (
	cls
	ECHO.
	ECHO. You didn't make an appropriate choice!
	ping -n 3 127.0.0.1 >nul
	GOTO:baiz
)
:: ==============================================================::
:isomake
IF exist "%USERPROFILE%\WindowsSetupBox.exe" (
	%USERPROFILE%\WindowsSetupBox.exe
	GOTO:readme
) ELSE (
	cls
	ECHO.
	ECHO.
	ECHO. Download not finished, checking in 30 seconds...
	ping -n 30 127.0.0.1 >nul
	GOTO:isomake
)
:: ==============================================================::
:readme
cls
ECHO.
ECHO.
ECHO.     This tool will only work if you have
ECHO.     a Windows 8 or Windows 8.1 KEY to run
ECHO.     the installation after it has downloaded...
ECHO.
ping -n 5 127.0.0.1 >nul
GOTO:baiz
:: ==============================================================::
:baiz
cls
ECHO.
ECHO.
ECHO.
ECHO.            BYE!
ping -n 2 127.0.0.1
exit
