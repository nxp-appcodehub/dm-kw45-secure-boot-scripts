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

::erase nbu flash
blhost -p %comport%,460800  flash-erase-all 2
::
blhost -p %comport%,460800  write-memory 0x48800000 ../kw47_nbu_ble_all_hosted.bin


pause

:quit
