#!/bin/bash

# --------------------------------------------------------------------------------
# Dockerized 360 to MP4 Conversion Script
#
# Purpose: This script runs a Docker container to convert GoPro Max .360 videos to MP4
#          format using a custom fork of ffmpeg. It ensures that input and output 
#          directories are correctly set and uses GPU acceleration if available.
#
# Important Note: This script uses Docker and assumes that the required Docker image 
#          is properly built and available. The Docker image should include ffmpeg 
#          with OpenCL support.
#
# Usage:   ./docker_360_2_mp4.sh <input_directory> <output_directory>
#
# Example: ./docker_360_2_mp4.sh /home/nbonnie/Desktop/360_test/test_input/ /home/nbonnie/Desktop/360_test/test_output/
#
# Input:
#     A directory containing .360 video files.
#
# Output:
#     MP4 video files in the specified output directory. The filenames will be
#     the same as the input files, but with the .mp4 extension.
#
# Script Workflow:
# 1. Validate Input: Checks if exactly two arguments are provided (input and output directories).
# 2. Set Directories: Converts relative paths to absolute paths for input and output directories.
# 3. Run Docker: Executes the Docker container with the specified image and mounted volumes.
#
# Notes:
# - Double check your directory that contains GPU drivers matches the one being mounted
#
# Author:       Nolan R. Bonnie
# Contact:      nolan.bonnie@colorado.edu
# Created:      08/2024
# --------------------------------------------------------------------------------


# Verify script is called w/ two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

# Assign input and output directories from script arguments
INPUT_DIR=$(realpath "$1")
OUTPUT_DIR=$(realpath "$2")

# Name of Docker image
DOCKER_IMAGE="nbonnie/360_2_mp4:latest"

# Run the Docker container with mounted volumes
docker run --rm --platform linux/amd64 \
    --gpus all \
    -v /usr/lib/x86_64-linux-gnu:/test_lib \
    -v "$INPUT_DIR":/input \
    -v "$OUTPUT_DIR":/output \
    "$DOCKER_IMAGE" \
    /bin/bash -c "./360_2_mp4.sh /input/ /output/"

# Process complete message
echo "Conversion complete. Output files are in: $OUTPUT_DIR"
