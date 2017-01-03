#!/bin/sh

set -e

PTHSEM_VERSION=2.0.8

mkdir -p packages

echo "Building pthsem"
wget https://www.auto.tuwien.ac.at/~mkoegler/pth/pthsem_$PTHSEM_VERSION.tar.gz
tar xzf pthsem_$PTHSEM_VERSION.tar.gz
cd pthsem-$PTHSEM_VERSION
dpkg-buildpackage -b -uc
cd ..
dpkg -i libpthsem*.deb
mv libpthsem*.deb packages

echo "Building knxd"
git clone https://github.com/knxd/knxd.git
cd knxd
dpkg-buildpackage -b -uc
cd ..
mv knxd_*.deb knxd-tools_*.deb packages

echo "Cleaning up"
rm -rf pthsem*
rm -rf knxd*

