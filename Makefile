.PHONY: build run

default: 
	@ echo "Available commands:"
	@ echo "make build 	- builds image"
	@ echo "make run 	- runs test version in docker container"

build:
	@ echo "Building image"
	docker image build --tag "wutchzone/go-docker-build" .

run:
	docker container run --rm -it -e PACKAGE_MANAGER="none" -v `pwd`/_example:/go/src -v `pwd`/out:/go/out "wutchzone/go-docker-build"
