# Login to Docker Hub first
docker login

# Replace 'horozgs' with your Docker Hub username
# Build server image
docker build -f docker/Dockerfile.server -t zortos/anthias-server:latest-pi4 .
docker build -f docker/Dockerfile.nginx -t zortos/anthias-nginx:latest-pi4 .
docker build -f docker/Dockerfile.viewer -t zortos/anthias-viewer:latest-pi4 .

# Build websocket image
docker build -f docker/Dockerfile.websocket -t zortos/anthias-websocket:latest-pi4 .

# Build celery image
docker build -f docker/Dockerfile.celery -t zortos/anthias-celery:latest-pi4 .

# Build redis image
docker build -f docker/Dockerfile.redis -t zortos/anthias-redis:latest-pi4 .

# Build nginx image

# Build wifi-connect image
docker build -f docker/Dockerfile.wifi-connect -t zortos/anthias-wifi-connect:latest-pi4 .


# Push all images to Docker Hub
docker push zortos/anthias-server:latest-pi4
docker push zortos/anthias-nginx:latest-pi4
docker push zortos/anthias-viewer:latest-pi4


docker push zortos/anthias-websocket:latest-pi4
docker push zortos/anthias-celery:latest-pi4
docker push zortos/anthias-redis:latest-pi4
docker push zortos/anthias-wifi-connect:latest-pi4

image: zortos/anthias-server:latest-pi4
image: zortos/anthias-nginx:latest-pi4
image: zortos/anthias-viewer:latest-pi4

./bin/deploy_to_balena.sh --board pi4 --fleet oonela

# Enable buildx
docker buildx create --name multiarch --use

# Login to Docker Hub
docker login

# Build and push the server image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.server \
  -t zortos/anthias-server:latest-pi4 \
  --push .

# Build and push the viewer image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.viewer \
  -t zortos/anthias-viewer:latest-pi4 \
  --push .

# Build and push the nginx image
docker buildx build --platform linux/arm64/v8 \
  -f docker/Dockerfile.nginx \
  -t zortos/anthias-nginx:latest-pi4 \
  --push .

    # Create a backup of the original template
  cp docker-compose.balena.yml.tmpl docker-compose.balena.yml.tmpl.backup
  
  # Update the template to use your username consistently
  sed -i 's|screenly/anthias|zortos/anthias|g' docker-compose.balena.yml.tmpl

    ./bin/deploy_to_balena.sh --board pi4 --fleet oonela

        cp docker-compose.balena.yml.tmpl docker-compose.balena.build.yml.tmpl