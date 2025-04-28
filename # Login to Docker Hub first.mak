# Login to Docker Hub first
docker login

# Replace 'horozgs' with your Docker Hub username
# Build server image
docker build -f docker/Dockerfile.server -t horozgs/anthias-server:latest-pi4 .
docker build -f docker/Dockerfile.nginx -t horozgs/anthias-nginx:latest-pi4 .
docker build -f docker/Dockerfile.viewer -t horozgs/anthias-viewer:latest-pi4 .

# Build websocket image
docker build -f docker/Dockerfile.websocket -t horozgs/anthias-websocket:latest-pi4 .

# Build celery image
docker build -f docker/Dockerfile.celery -t horozgs/anthias-celery:latest-pi4 .

# Build redis image
docker build -f docker/Dockerfile.redis -t horozgs/anthias-redis:latest-pi4 .

# Build nginx image

# Build wifi-connect image
docker build -f docker/Dockerfile.wifi-connect -t horozgs/anthias-wifi-connect:latest-pi4 .


# Push all images to Docker Hub
docker push horozgs/anthias-server:latest-pi4
docker push horozgs/anthias-nginx:latest-pi4
docker push horozgs/anthias-viewer:latest-pi4


docker push horozgs/anthias-websocket:latest-pi4
docker push horozgs/anthias-celery:latest-pi4
docker push horozgs/anthias-redis:latest-pi4
docker push horozgs/anthias-wifi-connect:latest-pi4

image: horozgs/anthias-server:latest-pi4
image: horozgs/anthias-nginx:latest-pi4
image: horozgs/anthias-viewer:latest-pi4

./bin/deploy_to_balena.sh --board pi4 --fleet oonela

# Enable buildx
docker buildx create --name multiarch --use

# Login to Docker Hub
docker login

# Build and push the server image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.server \
  -t horozgs/anthias-server:latest-pi4 \
  --push .

# Build and push the viewer image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.viewer \
  -t horozgs/anthias-viewer:latest-pi4 \
  --push .

# Build and push the nginx image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.nginx \
  -t horozgs/anthias-nginx:latest-pi4 \
  --push .

# Build and push the websocket image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.websocket \
  -t horozgs/anthias-websocket:latest-pi4 \
  --push .

# Build and push the celery image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.celery \
  -t horozgs/anthias-celery:latest-pi4 \
  --push .

# Build and push the redis image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.redis \
  -t horozgs/anthias-redis:latest-pi4 \
  --push .

# Build and push the wifi-connect image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.wifi-connect \
  -t horozgs/anthias-wifi-connect:latest-pi4 \
  --push .

    # Create a backup of the original template
  cp docker-compose.balena.yml.tmpl docker-compose.balena.yml.tmpl.backup
  
  # Update the template to use your username consistently
  sed -i 's|screenly/anthias|horozgs/anthias|g' docker-compose.balena.yml.tmpl

    ./bin/deploy_to_balena.sh --board pi4 --fleet oonela

        cp docker-compose.balena.yml.tmpl docker-compose.balena.build.yml.tmpl