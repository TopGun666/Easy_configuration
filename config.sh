#!/bin/bash

echo ""
echo "#######################################################################"
echo "#                          Start configuration!                       #"
echo "#                                 V 1.0.0                             #"
echo "#                                 by heyu                             #"
echo "#######################################################################"
echo ""


# update systemcd 
echo "#update system"
cd ~
echo 2013300337 | sudo -S command
sudo apt update -y
echo 2013300337 | sudo -S command
sudo apt dist-upgrade -y

#install dpkg
echo "#install dpkg"
echo 2013300337 | sudo -S command
sudo apt install dpkg-dev -y
#install nvidia-384
echo "#install nvidia-384"
echo 2013300337 | sudo -S command
sudo apt install nvidia-384-dev -y

# install some tools:
echo "#install git"
echo 2013300337 | sudo -S command
sudo apt install git -y

echo "#install cmake"
echo 2013300337 | sudo -S command
sudo apt install cmake -y

echo "#install some necessary tools"
echo 2013300337 | sudo -S command
sudo apt install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils gstreamer0.10-ffmpeg gstreamer1.0-libav -y

echo "#install libboost"
echo 2013300337 | sudo -S command
sudo apt install libboost-all-dev -y

echo "#install qtcreator"
echo 2013300337 | sudo -S command
sudo apt install qtcreator -y

echo "#install fcitx"
echo 2013300337 | sudo -S command
sudo apt install fcitx -y
sudo apt -f install -y

echo "#install chromium"
echo 2013300337 | sudo -S command
sudo apt install chromium-browser -y

echo "#install libgoogle-glog"
echo 2013300337 | sudo -S command
sudo apt install libgoogle-glog-dev -y

echo "#install eigen3"
echo 2013300337 | sudo -S command
sudo apt install libeigen3-dev -y

echo "#install suitesparse"
echo 2013300337 | sudo -S command
sudo apt install libsuitesparse-dev -y

echo "#install python-pip"
echo 2013300337 | sudo -S command
sudo apt install python-pip -y

echo "#install numpy shadowsocks scipy"
echo 2013300337 | sudo -S command
sudo pip install numpy
echo 2013300337 | sudo -S command
sudo pip install shadowsocks
echo 2013300337 | sudo -S command
sudo pip install scipy
sudo pip install --upgrade pip
#exit root permissions
#echo "#exit root permissions"
#exit

echo "#install some necessary library"
mkdir code
cd code
mkdir lib_tools
cd lib_tools
git clone https://github.com/opencv/opencv.git 
git clone https://github.com/TopGun666/fast.git
git clone https://github.com/strasdat/Sophus.git
git clone https://github.com/RainerKuemmerle/g2o.git

echo "#install OpenCV3"
cd ~/code/lib_tools/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D WITH_CUDA=ON -D WITH_TBB=ON -D WITH_V4L=ON-D WITH_GTK=ON -D WITH_OPENGL=ON -D BUILD_EXAMPLES=ON ..
make -j8
echo 2013300337 | sudo -S command 
sudo make install

echo "#install fast"
cd ~/code/lib_tools/fast
mkdir build
cd build
cmake ..
make -j8
echo 2013300337 | sudo -S command 
sudo make install

echo "#install Sophus"
cd ~/code/lib_tools/Sophus
mkdir build
cd build
cmake ..
make -j8
echo 2013300337 | sudo -S command 
sudo make install

echo "#install g2o"
cd ~/code/lib_tools/g2o
mkdir build
cd build
cmake ..
make -j8
echo 2013300337 | sudo -S command 
sudo make install

#install sogoupinyin input method
echo "#install sogoupinyin input method"
echo 2013300337 | sudo -S command
sudo dpkg -i ~/code/configuration/Thirdparty/sogoupinyin_2.2.0.0102_amd64.deb
cd ~/code/
mkdir learning
mkdir work
mkdir ex

#reboot your computer
#echo 2013300337 | sudo -S command 
#udo reboot


