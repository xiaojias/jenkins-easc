#!/bin/sh

# Build image
VERSION='2.176.1'
DOCKER_IMAGE="richardx/jenkins-master"

docker build -t ${DOCKER_IMAGE}:${VERSION} -f Dockerfile .
docker push ${DOCKER_IMAGE}:${VERSION}

docker tag ${DOCKER_IMAGE}:${VERSION} ${DOCKER_IMAGE}:latest
docker push ${DOCKER_IMAGE}:latest
