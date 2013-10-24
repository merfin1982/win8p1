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
    set VERSION=0.0.2-beta
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
	rem Windows has no built-in wget or curl, so generate a VBS script to do it:
	rem -------------------------------------------------------------------------
	set DLOAD_SCRIPT=download.vbs
	echo Option Explicit                                                    >  %DLOAD_SCRIPT%
	echo Dim args, http, fileSystem, adoStream, url, target, status         >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set args = Wscript.Arguments                                       >> %DLOAD_SCRIPT%
	echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1")              >> %DLOAD_SCRIPT%
	echo url = args(0)                                                      >> %DLOAD_SCRIPT%
	echo target = args(1)                                                   >> %DLOAD_SCRIPT%
	echo WScript.Echo "Getting '" ^& target ^& "' from '" ^& url ^& "'..."  >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo http.Open "GET", url, False                                        >> %DLOAD_SCRIPT%
	echo http.Send                                                          >> %DLOAD_SCRIPT%
	echo status = http.Status                                               >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo If status ^<^> 200 Then                                            >> %DLOAD_SCRIPT%
	echo    WScript.Echo "FAILED to download: HTTP Status " ^& status       >> %DLOAD_SCRIPT%
	echo    WScript.Quit 1                                                  >> %DLOAD_SCRIPT%
	echo End If                                                             >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set adoStream = CreateObject("ADODB.Stream")                       >> %DLOAD_SCRIPT%
	echo adoStream.Open                                                     >> %DLOAD_SCRIPT%
	echo adoStream.Type = 1                                                 >> %DLOAD_SCRIPT%
	echo adoStream.Write http.ResponseBody                                  >> %DLOAD_SCRIPT%
	echo adoStream.Position = 0                                             >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set fileSystem = CreateObject("Scripting.FileSystemObject")        >> %DLOAD_SCRIPT%
	echo If fileSystem.FileExists(target) Then fileSystem.DeleteFile target >> %DLOAD_SCRIPT%
	echo adoStream.SaveToFile target                                        >> %DLOAD_SCRIPT%
	echo adoStream.Close                                                    >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	rem -------------------------------------------------------------------------
	cscript //Nologo %DLOAD_SCRIPT% http://download.microsoft.com/download/6/7/B/67BB1487-B67A-4B3C-BF49-140AB1CF7B5F/Windows8-RT-KB2871389-x64.msu %USERPROFILE%\Windows8-RT-KB2871389-x64.msu
	GOTO:x64inst
)
IF %runbot% EQU 2 (
	rem Windows has no built-in wget or curl, so generate a VBS script to do it:
	rem -------------------------------------------------------------------------
	set DLOAD_SCRIPT=download.vbs
	echo Option Explicit                                                    >  %DLOAD_SCRIPT%
	echo Dim args, http, fileSystem, adoStream, url, target, status         >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set args = Wscript.Arguments                                       >> %DLOAD_SCRIPT%
	echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1")              >> %DLOAD_SCRIPT%
	echo url = args(0)                                                      >> %DLOAD_SCRIPT%
	echo target = args(1)                                                   >> %DLOAD_SCRIPT%
	echo WScript.Echo "Getting '" ^& target ^& "' from '" ^& url ^& "'..."  >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo http.Open "GET", url, False                                        >> %DLOAD_SCRIPT%
	echo http.Send                                                          >> %DLOAD_SCRIPT%
	echo status = http.Status                                               >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo If status ^<^> 200 Then                                            >> %DLOAD_SCRIPT%
	echo    WScript.Echo "FAILED to download: HTTP Status " ^& status       >> %DLOAD_SCRIPT%
	echo    WScript.Quit 1                                                  >> %DLOAD_SCRIPT%
	echo End If                                                             >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set adoStream = CreateObject("ADODB.Stream")                       >> %DLOAD_SCRIPT%
	echo adoStream.Open                                                     >> %DLOAD_SCRIPT%
	echo adoStream.Type = 1                                                 >> %DLOAD_SCRIPT%
	echo adoStream.Write http.ResponseBody                                  >> %DLOAD_SCRIPT%
	echo adoStream.Position = 0                                             >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	echo Set fileSystem = CreateObject("Scripting.FileSystemObject")        >> %DLOAD_SCRIPT%
	echo If fileSystem.FileExists(target) Then fileSystem.DeleteFile target >> %DLOAD_SCRIPT%
	echo adoStream.SaveToFile target                                        >> %DLOAD_SCRIPT%
	echo adoStream.Close                                                    >> %DLOAD_SCRIPT%
	echo.                                                                   >> %DLOAD_SCRIPT%
	rem -------------------------------------------------------------------------
	cscript //Nologo %DLOAD_SCRIPT% http://download.microsoft.com/download/0/C/6/0C67F34D-1F09-429D-B55E-794177982162/Windows8-RT-KB2871389-x86.msu %USERPROFILE%\Windows8-RT-KB2871389-x86.msu
	GOTO:x86inst
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
ECHO.    Download Win8.1 ISO Maker       [1]
ECHO.
ECHO.    Returning to Main Menu...
ping -n 3 127.0.0.1 >nul
GOTO:mainmenu
:: bitsadmin.exe /transfer "JobName" http://download.url/here.exe C:\destination\here.exe


http://web.esd.microsoft.com/W81GA/81GF9D695DA9DF8D56B2BC5B7356B5DA9D89D29D69/WindowsSetupBox.exe
:: ==============================================================::
:baiz
cls
ECHO.
ECHO.
ECHO.
ECHO.            BYE!
ping -n 3 127.0.0.1
exit