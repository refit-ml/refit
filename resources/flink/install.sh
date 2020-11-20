#!/bin/sh

curl -O https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tar.xz
tar -xf Python-3.8.3.tar.xz
cd Python-3.8.3
./configure --enable-optimizations
make -j 4
make altinstall
cd ../