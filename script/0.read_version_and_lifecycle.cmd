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

::BootStatus
blhost -p %comport%,460800  get-property 20
::SecurityState
blhost -p %comport%,460800  get-property 17
::SystemDeviceId
blhost -p %comport%,460800  get-property 16
::UniqueDeviceId
blhost -p %comport%,460800  get-property 18
::bootloader version
blhost -p %comport%,460800  get-property 1
::TargetVersion
blhost -p %comport%,460800 	get-property 24 

blhost -p %comport%,460800  -- fuse-read 0x1e 0x20
blhost -p %comport%,460800  -- fuse-read 0x1F 0x20
blhost -p %comport%,460800  -- fuse-read 0x20 0x20

blhost -p %comport%,460800  -- fuse-read 0x0a 6
@echo off
ECHO 0000_0000: Blank   0000_0001: NXP Fab  0000_0011: NXP Provisioned  0000_0111: OEM Open  0000_1111: OEM Secure World Closed  0001_1111: OEM Closed  1001_1111: OEM Locked  0011_1111: OEM Return  0111_1111: NXP Return  11xx_xxxx Brick
@echo on

pause

:quit
