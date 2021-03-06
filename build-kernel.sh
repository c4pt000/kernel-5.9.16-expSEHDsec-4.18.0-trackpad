#!/bin/bash



echo 'Crtl-C to exit and edit this script to uncomment for first time build'
sleep 5s

# uncomment these lines for first time build
#alias cp='cp -rf'
#alias mv='mv -v'
#mkdir -p /opt/kernel-build
#cd /opt/kernel-build
#mkdir -p /root/rpmbuild
#mkdir -p /root/rpmbuild/SPECS
#mkdir -p /root/rpmbuild/SOURCES
#mkdir -p /root/rpmbuild/SRPMS
#mkdir -p /root/rpmbuild/RPMS
#mkdir -p /root/rpmbuild/RPMS/x86_64



yum install nano wget xz rpm-build elfutils-libelf-devel openssl-devel openssl bc rsync -y
yum groupinstall "C Development Tools and Libraries" -y
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.11.6.tar.xz
tar -xvf linux-5.11.6.tar.xz
mv linux-5.11.6 kernel-5.11.6_penguin_expSEHDsec+T
cd kernel-5.11.6_penguin_expSEHDsec+T
wget https://raw.githubusercontent.com/c4pt000/kernel-5.11.0-expSEHDsec/master/config-5.11.6-penguin-expSEHDsec%2BT 
cp -rf config-5.11.6-penguin-expSEHDsec+T .config
cd drivers/video/
mv logo logo.null
wget https://github.com/c4pt000/kernel-5.11.0-expSEHDsec/raw/master/logo.tar.gz
tar -xvf logo.tar.gz 
cd ../../
cd drivers/input/
mv joystick joystick.null
wget https://github.com/c4pt000/kernel-5.11.0-expSEHDsec/raw/master/joystick.tar.gz
tar -xvf joystick.tar.gz
cd ../../../kernel-5.11.6_penguin_expSEHDsec+T/
echo 'cd kernel-5.11.6_penguin_expSEHDsec+T and'
echo 'make menuconfig to edit .config (or not to build as is) followed by'
echo ' make -j24 rpm-pkg               to build '
echo ' make -j24 modules '
echo ' make -j24 modules_install '
echo 'cd /root/rpmbuild/RPMS/x86_64/ '
echo 'ls -lah'
sleep 1s
