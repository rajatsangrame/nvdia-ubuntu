#! /bin/bash


# set the DEBIAN_FRONTEND variable to 'noninteractive' 
# refer this link for more information 
# https://askubuntu.com/questions/972516/debian-frontend-environment-variable

DEBIAN_FRONTEND=noninteractive

cd

sudo rm /etc/apt/apt.conf.d/*.*


sudo apt update

# create a folder to store files
mkdir setup
cd setup

# Download anaconda shell file
wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh

# Run the downloaded file
bash Anaconda3-5.0.1-Linux-x86_64.sh -b
cd

# Add the anaconda path to bashrc file
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
export PATH=~/anaconda3/bin:$PATH

# Restart terminal
source ~/.bashrc
sudo apt install unzip -y



# Install Nvidia graphic driver compatatible with tensorflow-gpu library
# Refer to the below link for more information
# https://www.tensorflow.org/install/gpu


sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-410 libnvidia-gl-410 nvidia-utils-410 xserver-xorg-video-nvidia-410 libnvidia-cfg1-410 libnvidia-ifr1-410 libnvidia-decode-410 libnvidia-encode-410

sudo nvidia-smi

cd
cd setup
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# Add PATH variable and LD_LIBRARY_PATH variable in .bashrc file

echo 'export PATH=/usr/local/cuda-9.0/bin${PATH:+:$PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64-deb

sudo dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64-deb

wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64-deb

sudo dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64-deb


# ============================================ we have to install CudNN package here =====================================

clear

echo "Go to this link := https://developer.nvidia.com/rdp/cudnn-archive"

echo "Click on Download cuDNN v7.1.4 (May 16, 2018), for CUDA 9.0"

echo "Than Copy Download link of cuDNN v7.1.4 Library for Linux"
# ========================================================================================================================

read -p "Enter the download link for CudNN 7.1.4 here: " path

# Go back to home directory
DEBIAN_FRONTEND=readline

cd

sudo rm /etc/apt/apt.conf.d/*.*


cd setup

wget $path

# rename the downloaded file 

mv cudnn* cudnn.tgz

tar -xzvf ~/setup/cudnn.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

sudo reboot


