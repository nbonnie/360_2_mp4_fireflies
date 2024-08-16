#!/bin/bash

# Verify script is called w/ two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

# Assign input and output directories from script arguments
INPUT_DIR=$(realpath "$1")
OUTPUT_DIR=$(realpath "$2")

# Name of custom Docker image
DOCKER_IMAGE="nbonnie/360_2_mp4:latest"

# Run the Docker container with mounted volumes
docker run --rm \
    -v "$INPUT_DIR":/input \
    -v "$OUTPUT_DIR":/output \
    "$DOCKER_IMAGE" \
    /bin/bash -c "./360_2_mp4.sh /input /output"

# Process complete message
echo "Conversion complete. Output files are in: $OUTPUT_DIR"
