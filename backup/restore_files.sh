#!/bin/bash

# Pad naar de backup-directory
BACKUP_DIR="/home/admin/backup/screenly"

# Bestanden/directories kopiëren met sudo
sudo cp "$BACKUP_DIR/docker-compose.yml.tmpl" /home/admin/screenly/docker-compose.yml.tmpl
sudo cp "$BACKUP_DIR/bin/start_server.sh" /home/admin/screenly/bin/start_server.sh
sudo cp -r "$BACKUP_DIR/templates/" /home/admin/screenly/
sudo cp -r "$BACKUP_DIR/static/img/" /home/admin/screenly/static/
sudo cp -r "$BACKUP_DIR/static/favicons/" /home/admin/screenly/static/
sudo cp "$BACKUP_DIR/static/sass/_variables.scss" /home/admin/screenly/static/sass/_variables.scss
sudo cp "$BACKUP_DIR/static/sass/_custom-bootstrap.scss" /home/admin/screenly/static/sass/_custom-bootstrap.scss
sudo cp -r "$BACKUP_DIR/staticfiles/img/" /home/admin/screenly/staticfiles/
sudo cp -r "$BACKUP_DIR/staticfiles/favicons/" /home/admin/screenly/staticfiles/
sudo cp "$BACKUP_DIR/staticfiles/sass/_variables.scss" /home/admin/screenly/staticfiles/sass/_variables.scss
sudo cp "$BACKUP_DIR/staticfiles/sass/_custom-bootstrap.scss" /home/admin/screenly/staticfiles/sass/_custom-bootstrap.scss
sudo cp "$BACKUP_DIR/ansible/roles/splashscreen/files/splashscreen.png" /home/admin/screenly/ansible/roles/splashscreen/files/splashscreen.png
sudo cp -r "$BACKUP_DIR/website/assets/images/" /home/admin/screenly/website/assets/

echo "Alle bestanden zijn succesvol gekopieerd met sudo."

cd /home/admin/screenly
./bin/upgrade_containers.sh
echo "Container is succesvol geüpgraded."