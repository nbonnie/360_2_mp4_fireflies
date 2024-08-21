VERSION=v1
DOCKERUSER=nbonnie

build:
	docker build -f Dockerfile -t 360_2_mp4 .

run:
	docker run -dit 360_2_mp4

# Run docker image interactively
runit:
	docker run --rm -it \
	nbonnie/360_2_mp4:latest \
	/bin/bash

# Run docker with connected volumes
# `/usr/lib/x86_64-linux-gnu` points towards local GPU drivers, change if necessary
runvol:
	docker run --rm -it \
	--gpus all \
	-v /usr/lib/x86_64-linux-gnu:/test_lib \
	-v "/home/nbonnie/Desktop/test_input":/input \
	-v "/home/nbonnie/Desktop/test_output":/output \
	nbonnie/360_2_mp4:latest \
	/bin/bash

push:
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker push $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:latest
	docker push $(DOCKERUSER)/360_2_mp4:latest
