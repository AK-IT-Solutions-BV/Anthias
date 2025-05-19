# Login to Docker Hub first
docker login

# Replace 'aksolutions' with your Docker Hub username
# Build server image
docker build -f docker/Dockerfile.server -t aksolutions/anthias-server:latest-pi4 .
docker build -f docker/Dockerfile.nginx -t aksolutions/anthias-nginx:latest-pi4 .
docker build -f docker/Dockerfile.viewer -t aksolutions/anthias-viewer:latest-pi4 .

# Build websocket image
docker build -f docker/Dockerfile.websocket -t aksolutions/anthias-websocket:latest-pi4 .

# Build celery image
docker build -f docker/Dockerfile.celery -t aksolutions/anthias-celery:latest-pi4 .

# Build redis image
docker build -f docker/Dockerfile.redis -t aksolutions/anthias-redis:latest-pi4 .

# Build nginx image

# Build wifi-connect image
docker build -f docker/Dockerfile.wifi-connect -t aksolutions/anthias-wifi-connect:latest-pi4 .


# Push all images to Docker Hub
docker push aksolutions/anthias-server:latest-pi4
docker push aksolutions/anthias-nginx:latest-pi4
docker push aksolutions/anthias-viewer:latest-pi4


docker push aksolutions/anthias-websocket:latest-pi4
docker push aksolutions/anthias-celery:latest-pi4
docker push aksolutions/anthias-redis:latest-pi4
docker push aksolutions/anthias-wifi-connect:latest-pi4

image: aksolutions/anthias-server:latest-pi4
image: aksolutions/anthias-nginx:latest-pi4
image: aksolutions/anthias-viewer:latest-pi4

./bin/deploy_to_balena.sh --board pi4 --fleet oonela

# Enable buildx
docker buildx create --name multiarch --use

# Login to Docker Hub
docker login

# Build and push the server image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.server \
  -t aksolutions/anthias-server:latest-pi4 \
  --push .

# Build and push the viewer image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.viewer \
  -t aksolutions/anthias-viewer:latest-pi4 \
  --push .

# Build and push the nginx image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.nginx \
  -t aksolutions/anthias-nginx:latest-pi4 \
  --push .

    # Create a backup of the original template
  cp docker-compose.balena.yml.tmpl docker-compose.balena.yml.tmpl.backup
  
  # Update the template to use your username consistently
  sed -i 's|screenly/anthias|aksolutions/anthias|g' docker-compose.balena.yml.tmpl

    ./bin/deploy_to_balena.sh --board pi4 --fleet oonela

        cp docker-compose.balena.yml.tmpl docker-compose.balena.build.yml.tmpl