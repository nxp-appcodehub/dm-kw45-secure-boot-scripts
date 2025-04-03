#Copyright 2021-2025 NXP
#All rights reserved.

#SPDX-License-Identifier: BSD-3-Clause

import os, binascii
SB3KDK_KEY_PATH = "../workspace/keys/sb3kdk.txt"
if True == os.path.exists(SB3KDK_KEY_PATH):
    print('SB3KDK exists')
else:
    with open(SB3KDK_KEY_PATH, "wb") as f:
        f.write(binascii.b2a_hex(os.urandom(32)))
    assert os.path.exists(SB3KDK_KEY_PATH)