#!/usr/bin/env bash

# install dependencies
apt-get update
apt-get install -y build-essential g++ bison flex texinfo mercurial subversion gettext bc libncurses5-dev git wget curl unzip libstdc++6:i386
ln -s /usr/include /usr/include/ncurses

# prepare work dir
mkdir /work

# install cmake 3.1.0
cd /work
apt-get remove -y cmake
curl https://cmake.org/files/v3.1/cmake-3.1.0.tar.gz -O
tar xf cmake-3.1.0.tar.gz
cd cmake-3.1.0
./configure
make
make install
export PATH="/usr/local/bin:$PATH"

# build kernel
mkdir -p /opt
cd /opt
wget http://www.treewalker.org/opendingux/opendingux-toolchain.2012-06-16.tar.bz2
tar xf opendingux-toolchain.2012-06-16.tar.bz2
rm opendingux-toolchain.2012-06-16.tar.bz2
cd /work
git clone -b jz-3.16-qemu https://github.com/dmitrysmagin/linux.git
cd linux
export ARCH=mips
export CROSS_COMPILE=/opt/opendingux-toolchain/usr/bin/mipsel-linux-
make gcw0-qemu_defconfig
make
mv vmlinux /pwd
cd ..
rm -rf linux

# build rootfs
cd /work
git clone -b opendingux-2012.11 https://github.com/dmitrysmagin/opendingux-buildroot.git
cd opendingux-buildroot
mkdir dl
cd dl
curl https://svwh.dl.sourceforge.net/project/alleg/allegro/4.4.2/allegro-4.4.2.tar.gz -O
curl https://master.dl.sourceforge.net/project/libpng/libpng12/older-releases/1.2.52/libpng-1.2.52.tar.bz2 -O
curl https://svwh.dl.sourceforge.net/project/dejavu/dejavu/2.33/dejavu-fonts-ttf-2.33.tar.bz2 -O
cd ..
sed -i -e "s/\$(HOST_DIR)\/usr\/bin\/cmake/\/usr\/local\/bin\/cmake/g" ./package/pkg-cmake.mk
make a380_defconfig
make
mv output/images/rootfs.squashfs /pwd

