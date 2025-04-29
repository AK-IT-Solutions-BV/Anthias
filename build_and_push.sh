#!/bin/bash

# Enable buildx
docker buildx create --name multiarch --use || true

# Login to Docker Hub
docker login

# Function to build and push an image
build_and_push() {
    local dockerfile=$1
    local imagename=$2
    echo "Building and pushing $imagename..."
    docker buildx build --platform linux/arm64/v8 \
        -f "$dockerfile" \
        -t "zortos/$imagename:latest-pi4" \
        --no-cache \
        --push .
}

# Build and push all images
build_and_push "docker/Dockerfile.server" "anthias-server"
build_and_push "docker/Dockerfile.viewer" "anthias-viewer"
build_and_push "docker/Dockerfile.nginx" "anthias-nginx"
build_and_push "docker/Dockerfile.websocket" "anthias-websocket"
build_and_push "docker/Dockerfile.celery" "anthias-celery"
build_and_push "docker/Dockerfile.redis" "anthias-redis"
build_and_push "docker/Dockerfile.wifi-connect" "anthias-wifi-connect"

echo "All images have been built and pushed successfully!" 