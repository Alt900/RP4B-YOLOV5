#!/bin/bash
set -e
#clone opencv
echo "Cloning Opencv..."
git clone https://github.com/opencv/opencv.git
echo "Installed...changing directory and creating build directory"
cd opencv
mkdir build
cd build
echo "configuring cmake..."
cmake ..
echo "Cmake configured...building Opencv..."
#n_cores/2 was used for multiprocessing stability
make -j$(nproc/2) -D ENABLE_NEON=ON -D ENABLE_VFPV3=ON
echo "Opencv build...installing and linking shared libraries..."
sudo make install
sudo ldconfig
make clean
cd
#reverts swap memory to default values
sed -i "s/CONF_MAXSWAP=2048/CONF_MAXSWAP=5120/g" "/sbin/dphys-swapfile"
sed -i "s/CONF_SWAPSIZE=5120/CONF_SWAPSIZE=512/g" "/etc/dphys-swapfile"
echo "memory swap max reverted to 2 gigabytes and size to 512 megabytes"
sudo apt-get update
sudo apt-get upgrade
sudo reboot -h now