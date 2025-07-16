@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpdebugmbox cmd -f kw45b41z8 start 
nxpdebugmbox cmd -f kw45b41z8 get-crp
nxpdebugmbox -n cmd -f kw45b41z8 famode -m ./NXP_Return_Signed.xip
nxpdebugmbox cmd -f kw45b41z8 get-crp

pause
