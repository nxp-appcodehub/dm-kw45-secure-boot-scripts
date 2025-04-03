@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpdebugmbox -f kw45b41z8 cmd start
nxpdebugmbox -f kw45b41z8 cmd get-crp
nxpdebugmbox -f kw45b41z8 -v -i pyocd auth -b 0x0 -c ../workspace/debug_auth/debug_auth_cert.dc -k ../workspace/keys/debug_authentication_key_ECC_384.pem
nxpdebugmbox -f kw45b41z8 cmd famode -m ../workspace//bootable_images/OEM_Return_Signed.xip
nxpdebugmbox -f kw45b41z8 cmd get-crp

pause