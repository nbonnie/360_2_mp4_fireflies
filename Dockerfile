FROM ubuntu:20.04

RUN apt-get update -qq
RUN apt-get upgrade
# Get gstreamer plugins
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
# Workaround for git-core install bug
RUN apt-get install -y git-core
# Install ffmpeg dependencies ( refer to: https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu )
RUN apt-get install -y autoconf automake build-essential cmake libass-dev libfreetype6-dev libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson ninja-build pkg-config texinfo wget yasm zlib1g-dev libunistring-dev libaom-dev
# Create dir for source code and binaries (/root/*)
RUN mkdir -p ~/ffmpeg_sources ~/bin
# Install libx264 (this installs v155, might need > v160)
RUN apt-get -y install libx264-dev
# Grab opencl headers for compiling ffmpeg manually
RUN apt-get -y install opencl-headers
RUN apt-get -y install ocl-icd-opencl-dev
# Set directory
WORKDIR /root
# Clone ffmpeg fork
RUN git clone https://github.com/gmat/goproMax-ffmpeg-v5.git
RUN git clone https://github.com/nbonnie/firefly_processing_auto.git
# Go into dir
WORKDIR /root/goproMax-ffmpeg-v5
# Build ffmpeg (can take several minutes to execute) (-j sets the number of cpus to task)
RUN ./configure --enable-opencl --enable-opengl --enable-sdl2 --enable-libx264 --enable-gpl --disable-x86asm
RUN make -j$(nproc)
RUN make -j$(nproc) install
# Go into /root where git packages exist
WORKDIR /root