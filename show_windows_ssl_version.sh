#!/bin/bash

WRK=/tmp/openssl

# Let's go to a working directory
rm -rf $WRK
mkdir $WRK
cd $WRK

# Grabbing openssl and a config file from somewhere
curl -O http://indy.fulgan.com/SSL/openssl-1.0.1g-i386-win32.zip
curl -O http://stuff.mit.edu/afs/athena/contrib/crypto/openssl.cnf
unzip openssl-1.0.1g-i386-win32.zip

# Write out a windows batch command
cat>show_ver.cmd<<'EOF'
:: Set openssl cnf path
set OPENSSL_CONF=%CD%\openssl.cnf
openssl version
EOF

wine cmd /c show_ver.cmd 
