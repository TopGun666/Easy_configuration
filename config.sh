#!/bin/bash

echo ""
echo "#######################################################################"
echo "#                          Start configuration!                       #"
echo "#                                 V 2.0.0                             #"
echo "#                                 by heyu                             #"
echo "#######################################################################"
echo ""

read -p "Input your passwords for root:" -s pswd
echo $pswd | sudo -S apt update -y
echo $pswd | sudo -S apt dist-upgrade -y

#install dpkg
echo $pswd | sudo -S apt install -y dpkg dpkg-dev

# install some tools:
echo "install git"
echo $pswd | sudo -S apt install git -y

#install nvidia-384
echo "#install nvidia-384"
echo passwords | sudo -S command
echo $pswd | sudo -S apt install nvidia-384-dev -y

#install opencv dependency
echo "install opencv dependency"
echo $pswd | sudo -S apt install -y build-essential checkinstall cmake yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils gstreamer0.10-ffmpeg gstreamer1.0-libav 

echo "#install some necessary tools"
echo $pswd | sudo -S apt install -y libboost-all-dev qtcreator fcitx chromium-browser libgoogle-glog-dev libsuitesparse-dev libxmu-dev 
sudo apt -f install

echo "#install python-pip"
sudo apt install -y python-pip

mkdir ~/code
cd ~/code
mkdir lib_tools
cd lib_tools
git clone https://github.com/opencv/opencv.git 
git clone https://github.com/uzh-rpg/fast.git
git clone https://github.com/ceres-solver/ceres-solver.git
git clone https://github.com/RainerKuemmerle/g2o.git

echo "install eigen"
cd ~/code/lib_tools/
wget -c http://bitbucket.org/eigen/eigen/get/3.3.4.tar.gz
tar -xvf 3.3.4.tar.gz
cd eigen-eigen-5a0156e40feb
mkdir build
cd ./build
cmake -DEIGEN_TEST_CXX11=1 -DEIGEN_TEST_CUDA=1 ..
make 
echo $pswd | sudo -S make install

echo "install ceres-solver"
cd ~/code/lib_tools/ceres-solver
mkdir build
cd ./build
cmake ..
make 
echo $pswd | sudo -S make install

echo "install OpenCV3"
cd ~/code/lib_tools/opencv
mkdir build
cd build
cmake -DWITH_QT=ON \
-DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DINSTALL_C_EXAMPLES=ON \
-DWITH_CUDA=ON \    # using CUDA  
-DWITH_TBB=ON \
-D WITH_V4L=ON \
-D WITH_OPENGL=ON ..
make -j
echo $pswd | sudo -S make install

echo "install fast"
cd ~/code/lib_tools/fast
mkdir build
cd build
cmake ..
make -j
echo $pswd | sudo -S make install


echo "install g2o"
cd ~/code/lib_tools/g2o
mkdir build
cd build
cmake ..
make -j
echo $pswd | sudo -S make install

#install sogoupinyin input method
echo "#install sogoupinyin input method"
echo $pswd | sudo -S dpkg -i ~/code/Easy_configuration/Thirdparty/sogoupinyin_2.2.0.0102_amd64.deb

cd ~/code/
mkdir learning
mkdir work
mkdir ex

echo ""
echo "#######################################################################"
echo "#                              Congratulations!                       #"
echo "#             Your Ubuntu 16.04 has been configurated for VSLAM.      #"
echo "#                               by heyu.nwpu                          #"
echo "#######################################################################"
echo ""


