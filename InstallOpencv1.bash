#!/bin/bash

#If you don't want to waste 20-40 minutes of your life
#Increase the swap memory size if you don't have a total
#memory greater than 5.8GB

#You can do this with :~$ sudo nano /sbin/dphys-swapfile
#change the CONF_MAXSWAP to the size in MBfor example CONF_MAXSWAP = 5120 for 5 gigabytes
#then change CONF_SWAPSIZE in :~$ sudo nano /etc/dphys-swapfile 
#to the exact same size as CONF_MAXSWAP

#this chunk below automatically takes care of that issue and reverts the changes further down in the script 

sed -i "s/CONF_MAXSWAP=5120/CONF_MAXSWAP=2048/g" "/sbin/dphys-swapfile"
sed -i "s/CONF_SWAPSIZE=512/CONF_SWAPSIZE=5120/g" "/etc/dphys-swapfile"
echo "Modified memory swap max and size to 5 gigabytes max"

set -e
echo "Installing Opencv dependencies..."

sudo apt-get update -y
sudo apt-get upgrade -y

#build tools
sudo apt-get install -y build-essential cmake git unzip pkg-config
#image/video processing
sudo apt-get install -y libjpeg-dev libpng-dev libwebp-dev ffmpeg libtiff-dev libopenjp2-7-dev libopenexr-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
#GUI
sudo apt-get install -y libgtk2.0-dev libcanberra-gtk* libgtk-3-dev libxcb1-dev 
#Gstreamer
sudo apt-get install -y libgstreamer1.0-dev gstreamer1.0-gtk3
sudo apt-get install -y libgstreamer-plugins-base1.0-dev gstreamer1.0-gl
#video codec
sudo apt-get install -y libxvidcore-dev libx264-dev
#python 
sudo apt-get install -y python3-dev python3-numpy python3-pip
#threading and camera
sudo apt-get install -y libtbbmalloc2 libtbb-dev libdc1394-dev
sudo apt-get install -y libv4l-dev v4l-utils
#BLAS and LAPACK
sudo apt-get install -y libopenblas-dev libatlas-base-dev libblas-dev
sudo apt-get install -y liblapack-dev gfortran libhdf5-dev
#protobuf and logging
sudo apt-get install -y libprotobuf-dev libgoogle-glog-dev libgflags-dev
sudo apt-get install -y protobuf-compiler libeigen3-dev

sudo reboot -h now