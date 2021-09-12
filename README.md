# nextcloud-dockerized
Nextcloud mit docker-compose betreiben

Diese paar Files benutze ich um meine Nextcloud Installation zu betreiben. Und so funktioniert es auch bei dir:

1. Passe evtl. die zwei Pfade im docker-compose.yaml an. Dort wird die Datenbank und die Files abgelegt.
2. Kopiere `db.env.template` nach `db.env`
3. Kopiere `letsencrypt.env.template` nach `letsencrypt.env`
4. Setze die Variablen in der Datei `db.env` und `letsencrypt.env`
5. Starte das Ganze mit `docker-compose up`

## Backup
Die MariaDB und die Files sollten regelmässig gesichert werden. Bevor die MariaDB gesichert werden kann, muss
man einen Dump davon erstellen. Das tue ich mit dem Skript `dump-db.sh`, welches ich mit einem Cron Job ausführe.
Z.B. so:

```
0 3 * * * cd nextcloud-dockerized && ./dump_db.sh > /home/roman/nextcloud-dockerized/dump-db.log 2>&1
```

Nun liegt immer ein file `db-dump.sql.gz` im lokalen Verzeichnis, das du dann sichern kannst.

## Upgrade
Um die neusten Sicherheitsupdates und -Features zu bekommen, sollten wir immer die neuste Nextcloud-Version
einsetzen. Mit Docker ist das ganz einfach. Offiziell ist das hier dokumentiert: (https://github.com/docker-library/docs/blob/master/nextcloud/README.md#update-to-a-newer-version)

Zusammengefasst bedeutet das folgendes:

1. In docker-compose.yaml die Version von Nextcloud aktualisieren
2. `docker-compose pull`
3. `docker-compose down`
4. `docker-compose up -d`

Nach dem Upgrade schaue ich jeweils ins Log rein: `docker-compose logs -f app`. Der Startup des Servers kann schon ein paar 
Minuten dauern. Ein normales Log schaut etwa so aus:

```
app_1                    | Initializing finished
app_1                    | Nextcloud or one of the apps require upgrade - only a limited number of commands are available
app_1                    | You may use your browser or the occ upgrade command to do the upgrade
app_1                    | Setting log level to debug
app_1                    | Turned on maintenance mode
app_1                    | Updating database schema
app_1                    | Updated database
app_1                    | Checking for update of app activity in appstore
app_1                    | Checked for update of app "activity" in appstore
app_1                    | Checking for update of app oauth2 in appstore
app_1                    | Checked for update of app "oauth2" in appstore
app_1                    | Checking for update of app password_policy in appstore
app_1                    | Checked for update of app "password_policy" in appstore
...
app_1                    | Starting code integrity check...
app_1                    | Finished code integrity check
app_1                    | Update successful
app_1                    | Turned off maintenance mode
app_1                    | Resetting log level
```

Du hast nun nextcloud erfolgreich auf die neue Version aktualisiert.
