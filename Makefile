APP_NAME := hello
GO_FILE := hello.go
BINARY := $(APP_NAME)
ARCH := arm64
OS := linux

.PHONY: all build clean docker-build up down logs

all: build

## Build Go binary for Linux ARM64
build:
	GOARCH=$(ARCH) GOOS=$(OS) CGO_ENABLED=0 go build -o $(BINARY) $(GO_FILE)

## Remove outputs
clean:
	rm -f $(BINARY) my-arm64-helloworld.tar

## Build Docker image
docker-build:
	docker buildx build --platform linux/arm64 -t my-arm64-helloworld .

## Export Docker image to tar
docker-save:
	docker save my-arm64-helloworld -o my-arm64-helloworld.tar

## Start container
up:
	docker-compose up

## Stop and remove container
down:
	docker-compose down

## View container logs
logs:
	docker-compose logs -f
