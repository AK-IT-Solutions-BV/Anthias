Wat ik heb gedaan!

1. pi os lite 64
2. $ bash <(curl -sL https://install-anthias.srly.io)
 Yes,yes,yes,yes
3. Na boot alle files gewijzigd dat nodig waren.

alle gewijzigde files zitten in /home/admin/backup/screenly/ rest van path is zelfde 

Files waar ze moeten komen 
/home/admin/screenly/docker-compose.yml.tmpl
/home/admin/screenly/bin/start_server.sh
/home/admin/screenly/templates/
/home/admin/screenly/static/img/
/home/admin/screenly/static/favicons/
/home/admin/screenly/static/sass/_variables.scss
/home/admin/screenly/static/sass/_custom-bootstrap.scss
/home/admin/screenly/staticfiles/img/
/home/admin/screenly/staticfiles/favicons/
/home/admin/screenly/staticfiles/sass/_variables.scss
/home/admin/screenly/staticfiles/sass/_custom-bootstrap.scss
/home/admin/screenly/ansible/roles/splashscreen/files/splashscreen.png
/home/admin/screenly/website/assets/images/

4. dan of ssh of via pi command `cd screenly` `./bin/upgrade_containers.sh

5. als hij niet zelf reboot `sudo reboot`