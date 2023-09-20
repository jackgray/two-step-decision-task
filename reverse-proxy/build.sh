#!/bin/env bash

source ../.env

# Build the Docker image and tag it with the version number
docker build -t "$DOCKER_IMAGE_REVERSE_PROXY" .


# Push the image to Docker Hub
docker push "$DOCKER_IMAGE_REVERSE_PROXY"
