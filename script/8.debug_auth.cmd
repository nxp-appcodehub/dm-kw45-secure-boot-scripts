@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpdebugmbox cmd -f kw45b41z8 start 

nxpdebugmbox -i pyocd -v dat auth  -c ../config/dat_config.yaml


pause