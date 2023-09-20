#!/bin/env bash

source .env

# Build the Docker image and tag it with the version number
docker build -t "$DOCKER_IMAGE_CLIENT" .

# Optionally, also tag the image as 'latest'
# docker tag "${DOCKER_IMAGE_TWOSTEP}" jackgray/"$CONTAINER_NAME_TWOSTEP":"${TWOSTEP_VERSION}"

# Push the image to Docker Hub
docker push "$DOCKER_IMAGE_CLIENT"
# docker push jackgray/"$CONTAINER_NAME_REVERSE_PROXY":"${PROXY_VERSION}"