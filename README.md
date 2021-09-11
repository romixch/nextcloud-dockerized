# nextcloud-dockerized
Nextcloud mit docker-compose betreiben

Diese paar Files benutze ich um meine Nextcloud Installation zu betreiben. Und so funktioniert es auch bei dir:

1. Passe evtl. die zwei Pfade im docker-compose.yaml an. Dort wird die Datenbank und die Files abgelegt.
2. Kopiere `db.env.template` nach `db.env`
3. Kopiere `letsencrypt.env.template` nach `letsencrypt.env`
4. Setze die Variablen in der Datei `db.env` und `letsencrypt.env`
5. Starte das Ganze mit `docker-compose up`

