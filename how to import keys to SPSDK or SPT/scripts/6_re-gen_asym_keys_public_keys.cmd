@rem Copyright 2021-2025 NXP
@rem All rights reserved.

@rem SPDX-License-Identifier: BSD-3-Clause

openssl x509 -in ..\workspace\asymetric_keys\ec_secp384r1_cert0.pem -pubkey -noout > ..\workspace\asymetric_keys\ec_secp384r1_cert0.pub
openssl x509 -in ..\workspace\asymetric_keys\ec_secp384r1_cert1.pem -pubkey -noout > ..\workspace\asymetric_keys\ec_secp384r1_cert1.pub
openssl x509 -in ..\workspace\asymetric_keys\ec_secp384r1_cert2.pem -pubkey -noout > ..\workspace\asymetric_keys\ec_secp384r1_cert2.pub
openssl x509 -in ..\workspace\asymetric_keys\ec_secp384r1_cert3.pem -pubkey -noout > ..\workspace\asymetric_keys\ec_secp384r1_cert3.pub
openssl x509 -in ..\workspace\asymetric_keys\ec_secp384r1_sign_cert.pem -pubkey -noout > ..\workspace\asymetric_keys\ec_secp384r1_sign_cert.pub
