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
runvol:
	docker run --rm -it \
	-v "/Users/nbonnie/Desktop/360_test_data":/input \
	-v "/Users/nbonnie/Desktop/360_test_output":/output \
	nbonnie/360_2_mp4:latest \
	/bin/bash

push:
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker push $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:latest
	docker push $(DOCKERUSER)/360_2_mp4:latest