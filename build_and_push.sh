#!/bin/bash

# Enable buildx
docker buildx use --name multiarch --use || docker buildx create --name multiarch --use

# Login to Docker Hub
docker login

# First, generate the proper Dockerfiles with static file building enabled
ENVIRONMENT=production ./bin/generate_dev_mode_dockerfiles.sh

# Function to build and push an image
build_and_push() {
    local dockerfile=$1
    local imagename=$2
    local tag=$3
    echo "Building and pushing $imagename with tag $tag..."
    docker buildx build --platform linux/arm64/v8,linux/arm/v8 \
        -f "$dockerfile" \
        -t "zortos/$imagename:$tag" \
        --no-cache \
        --push .
}

# Define the tag
TAG="latest-arm"

# Build and push all images
build_and_push "docker/Dockerfile.server" "anthias-server" "$TAG"
# build_and_push "docker/Dockerfile.viewer" "anthias-viewer" "$TAG"
build_and_push "docker/Dockerfile.nginx" "anthias-nginx" "$TAG"
build_and_push "docker/Dockerfile.websocket" "anthias-websocket" "$TAG"
# build_and_push "docker/Dockerfile.celery" "anthias-celery" "$TAG"
# build_and_push "docker/Dockerfile.redis" "anthias-redis" "$TAG"
# build_and_push "docker/Dockerfile.wifi-connect" "anthias-wifi-connect" "$TAG"

echo "All images have been built and pushed successfully!"