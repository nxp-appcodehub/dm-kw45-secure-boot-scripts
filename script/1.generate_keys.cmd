@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

nxpcrypto key generate -k secp384r1 -o "..\workspace\keys\ROT1_p384.pem"
nxpcrypto key generate -k secp384r1 -o "..\workspace\keys\ROT2_p384.pem"
nxpcrypto key generate -k secp384r1 -o "..\workspace\keys\ROT3_p384.pem"
nxpcrypto key generate -k secp384r1 -o "..\workspace\keys\ROT4_p384.pem"
python generate_SB3KDK.py
type ..\workspace\keys\sb3kdk.txt


nxpimage cert-block export -c "..\config\ROT1_cert_block.yaml" -f kw45b41z8
nxpimage cert-block export -c "..\config\ROT2_cert_block.yaml" -f kw45b41z8
nxpimage cert-block export -c "..\config\ROT3_cert_block.yaml" -f kw45b41z8
nxpimage cert-block export -c "..\config\ROT4_cert_block.yaml" -f kw45b41z8

nxpcrypto key generate -k secp384r1 -o "..\workspace\keys\ISK1_1_p384.pem"
nxpimage cert-block export -c "..\config\IMG1_1_cert_block.yaml" -f kw45b41z8



ECHO off
ECHO WARNING!!!  
ECHO If new keys are generated, please modify the script 2.program_keys_to_device.cmd
ECHO WARNING!!!
ECHO on

pause