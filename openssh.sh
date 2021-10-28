#!/bin/bash
cd /usr/local
mkdir openssl openssh
cd openssl
echo "ready to update" >> /usr/local/update.log
wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
tar -zxvf openssl-1.1.1k.tar.gz
cd  openssl-1.1.1k
./config --prefix=/usr/local/openssl
./config -t
make && make install
cd /usr/local
ldd /usr/local/openssl/bin/openssl
mv /usr/bin/openssl /usr/bin/openssl.bak
mv /usr/include/openssl /usr/include/openssl.bak
sudo ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
sudo ln -s /usr/local/openssl/include/openssl /usr/include/openssl
echo "/usr/local/openssl/lib" >> /etc/ld.so.conf
sudo ldconfig -v
sudo ln -s /usr/local/openssl/lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1
sudo ln -s /usr/local/openssl/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
