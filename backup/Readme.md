# 📺 Screenly Installatie & Restore Handleiding

Een kort stappenplan voor het opzetten van Screenly met aangepaste bestanden op een Raspberry Pi.

---

## ✅ Wat ik heb gedaan

### 1. Raspberry Pi OS Lite 64-bit installeren
Zorg dat je een schone installatie hebt van **Pi OS Lite (64-bit)**.

---

### 2. Screenly Anthias installeren
Voer onderstaande command uit op je Pi:

```bash
bash <(curl -sL https://install-anthias.srly.io)
```

Beantwoord de installatievragen allemaal met `yes`.

---

### 3. Backup bestanden kopiëren
Na de eerste boot:

- Kopieer de map `backup` naar:  
  ```bash
  /home/admin/
  ```

> Alle gewijzigde bestanden bevinden zich in `/home/admin/backup/` met behoud van het originele pad vanaf `/home/admin/screenly/`.

---

### 📁 Overzicht aangepaste bestanden

De volgende bestanden en mappen worden overschreven of toegevoegd:

```
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
```

---

## 🔄 Restore script gebruiken (na stap 3)

1. Zorg dat de `backup` map staat in `/home/admin/`
2. Open een terminal op de Pi:
   ```bash
   cd /home/admin
   ./backup/restore_files.sh
   ```

> Het script plaatst alle bestanden automatisch op de juiste plek.

---

### 4. Reboot indien nodig

Als de Pi niet automatisch herstart, doe dit dan handmatig:

```bash
sudo reboot
```

---

✅ **Na reboot is je aangepaste Screenly installatie klaar voor gebruik!**

