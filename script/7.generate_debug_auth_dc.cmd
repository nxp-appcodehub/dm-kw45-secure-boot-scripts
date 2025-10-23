@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpcrypto key generate -k secp384r1 -o "../workspace/keys/debug_authentication_key_ECC_384.pem"

nxpdebugmbox dat dc export -c ../config/deb_auth_config.yaml -o ../workspace/debug_auth/debug_auth_cert.dc


pause