#!/bin/sh


[ -z "$KMIP_PORT" ] && KMIP_PORT="5696"
[ -z "$KMIP_KEY_PATH" ] && KMIP_KEY_PATH="/ssl/key.pem"
[ -z "$KMIP_CERT_PATH" ] && KMIP_CERT_PATH="/ss/cert.pem"
[ -z "$KMIP_CA_PATH" ] && KMIP_CA_PATH="/ssl/ca.pem"

# mkdir -p /etc/pykmip

# cat > /etc/pykmip/server.conf << EOF
# [server]
# hostname=0.0.0.0
# port=$KMIP_PORT
# certificate_path=$KMIP_CERT_PATH
# key_path=$KMIP_KEY_PATH
# ca_path=$KMIP_CA_PATH
# auth_suite=Basic
# policy_path=/etc/pykmip/policies
# enable_tls_client_auth=True
# tls_cipher_suites=
#     TLS_RSA_WITH_AES_128_CBC_SHA256
#     TLS_RSA_WITH_AES_256_CBC_SHA256
#     TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
# logging_level=DEBUG
# EOF

exec python3 /usr/local/bin/run_server.py
