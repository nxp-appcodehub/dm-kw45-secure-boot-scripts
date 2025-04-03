@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

:: Script to load Lifecycle to device fuses.
ECHO off
ECHO WARNING!!! Script performs destructive operation (programs fuses), are you sure that you would like to advance the LC to OEM_Closed Press ctrl+c to cancel execution or press space to continue.
ECHO on
pause

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

:: Update connection settings according your local configuration "-p COMX", for details see blhost User's Guide in .\doc folder.
:: Increase voltage for fuse burning
blhost -p %comport%,460800 set-property 0x16 1


:: change lifecycle
blhost -p %comport%,460800 -- fuse-program 0x0A "{{1F}}"

blhost -p %comport%,460800 -- get-property 8 1

blhost -p %comport%,460800 -- fuse-read 0x0a 6

:: Set voltage to normal value
blhost -p %comport%,460800 set-property 0x16 0
pause
:quit