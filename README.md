# nextcloud-dockerized
Nextcloud mit docker-compose betreiben

Diese paar Files benutze ich um meine Nextcloud Installation zu betreiben. Und so funktioniert es auch bei dir:

1. Passe evtl. die zwei Pfade im docker-compose.yaml an. Dort wird die Datenbank und die Files abgelegt.
2. Setze die Variablen in der Datei `db.env` und `letsencrypt.env`
3. Starte das Ganze mit `docker-compose up`

