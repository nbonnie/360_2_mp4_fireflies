# 360_2_mp4_fireflies

%---------------------------------------------------------------------------
% # Docker-Based 360 Video Conversion Script
%---------------------------------------------------------------------------
% This script converts .360 video files to .mp4 format using a Docker container 
% with a custom FFmpeg build. This process allows us to automate video processing
% without depending on GoPro software.
%
% Key Features:
% * Dockerized Environment: Utilizes a Docker container to ensure consistent 
%   processing environment.
% * GPU Acceleration: Uses NVIDIA GPUs for hardware-accelerated video processing.
% * Custom FFmpeg Build: Includes a custom FFmpeg build with support for .360 files.
%
%---------------------------------------------------------------------------
% Usage
%---------------------------------------------------------------------------
% Prerequisites:
% * Docker installed and running
% * NVIDIA GPU with appropriate drivers and Docker NVIDIA runtime
%
% Instructions:
% 1. Clone the repository or download the Docker image:
%
%    ```bash
%    docker pull nbonnie/360_2_mp4:latest
%    ```
%
% 2. Ensure your NVIDIA drivers and Docker setup are correctly configured.
%
% 3. Run the Script:
%    * Make sure to replace `<input_directory>` and `<output_directory>` with
%      the appropriate paths.
%       ```bash
%       ./docker_360_2_mp4.sh <input_directory> <output_directory>
%       ```
%
%---------------------------------------------------------------------------
% Note
%---------------------------------------------------------------------------
% Depending on how your system dricers are installed, you may need to manually
% configure the path to the folder containing your drivers in docker_360_2_mp4.sh
% Replace /usr/lib/x86_64-linux-gnu with the path to your local drivers.
%
%---------------------------------------------------------------------------
% Output
%---------------------------------------------------------------------------
% The script processes video files from the specified input directory and 
% saves the converted .mp4 files to the output directory.
%
%---------------------------------------------------------------------------
% Local Installation Requirements
%---------------------------------------------------------------------------
% For a local setup, the following packages need to be installed:
%
% # NVIDIA Drivers and CUDA
% `nvidia-driver-535`
% `nvidia-utils-535`
% `cuda-toolkit-12-2`
%
% # OpenCL Libraries and Tools
% `ocl-icd-libopencl1`
% `opencl-headers`
% `ocl-icd-opencl-dev`
% `nvidia-opencl-dev`
%
% # FFmpeg Dependencies
% `autoconf`
% `automake`
% `build-essential`
% `cmake`
% `libass-dev`
% `libfreetype6-dev`
% `libgnutls28-dev`
% `libmp3lame-dev`
% `libsdl2-dev`
% `libtool`
% `libva-dev`
% `libvdpau-dev`
% `libvorbis-dev`
% `libxcb1-dev`
% `libxcb-shm0-dev`
% `libxcb-xfixes0-dev`
% `meson`
% `ninja-build`
% `pkg-config`
% `texinfo`
% `wget`
% `yasm`
% `zlib1g-dev`
% `libunistring-dev`
% `libaom-dev`
% `libx264-dev`
%
% # Docker and NVIDIA Docker Integration
% `nvidia-container-toolkit`
% `nvidia-docker2`
%
% # Miscellaneous Tools
% `vim`
% `git-core`
%
%---------------------------------------------------------------------------
% License
%---------------------------------------------------------------------------
% This project is licensed under the MIT License - see the LICENSE file for details.
