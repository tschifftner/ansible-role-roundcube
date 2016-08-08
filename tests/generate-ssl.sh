#!/usr/bin/env bash

SSL_CERT=/opt/roundcube/.ssl/certificate.crt
SSL_KEY=/opt/roundcube/.ssl/certificate.key

mkdir -p /opt/roundcube/.ssl/

#Create the request
echo "Creating CSR"
openssl req -new -x509 -days 365 -nodes -out $SSL_CERT -keyout $SSL_KEY \
    -subj "/C=DE/ST=SRL/L=SB/O=/OU=Travis CI Test SSL Certificate/CN=localhost/emailAddress=root@localhost"

chown root:root $SSL_CERT $SSL_KEY
chmod 0444 $SSL_CERT
chmod 0400 $SSL_KEY

# Make trustchain.crt
cp /opt/roundcube/.ssl/certificate.crt /opt/roundcube/.ssl/trustchain.crt