@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpdebugmbox -f kw45b41z8 cmd start
nxpdebugmbox -f kw45b41z8 cmd get-crp
nxpdebugmbox -f kw45b41z8 cmd famode -m ./NXP_Return_Signed.xip
nxpdebugmbox -f kw45b41z8 cmd get-crp

pause
