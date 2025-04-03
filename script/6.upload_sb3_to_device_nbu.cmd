@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

@echo off
:select_comport
reg query "HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM" /v  \Device\*

set /P comport=Please select comport name: 

if "%comport%"=="" (
	goto quit
) else if /i not "%comport:~0,3%"=="com" (
	set comport=
	goto select_comport
)
@echo on

:: Script uploads SB3.1 file with NBU image to device.
:: Update the connection to the device according your configuration "-p COMX", see blhost User's Guide in .\doc folder.
blhost -p %comport%,460800 receive-sb-file ..\workspace\bootable_images\app_nbu.sb3
pause
:quit