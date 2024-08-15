VERSION=v1
DOCKERUSER=nbonnie

build:
	docker build -f Dockerfile -t 360_2_mp4 .

run:
	docker run -dit 360_2_mp4

push:
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker push $(DOCKERUSER)/360_2_mp4:$(VERSION)
	docker tag 360_2_mp4 $(DOCKERUSER)/360_2_mp4:latest
	docker push $(DOCKERUSER)/360_2_mp4:latest