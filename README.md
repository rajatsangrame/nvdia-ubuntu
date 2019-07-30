# Set up Tensorflow GPU

This script will install the following things on your system :-


=> Anaconda3-5.0.1
=> Nvidia Driver 410/390 
=> Cuda 9.0
=> CudNN 7.1.4 for CUDA 9.0

# Steps to run the script 

Run the following commands on the system

>>> git clone https://github.com/rajatsangrame/nvdia-ubuntu.git

>>> bash ~/setup-tensorflow-gpu/setup-nvidia-xxx.sh

When asked for the CudNN path go to the following link, perform the following step to get the download link

Step 1 : Go to this link := https://developer.nvidia.com/rdp/cudnn-archive

Step 2 : Click on Download cuDNN v7.1.4 (May 16, 2018), for CUDA 9.0

Step 3 : Than Copy Download link of cuDNN v7.1.4 Library for Linux

Paste the download link in the terminal and hit enter

When setup is complete the script will reboot the system so that the new changes will reflect in the system

