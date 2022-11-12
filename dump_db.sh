#!/bin/bash

echo db dump read env

export $(cat db.env | xargs)

echo db dump started...
docker exec nextcloud-dockerized-db-1 /usr/bin/mysqldump -h db -u root --password=$MYSQL_ROOT_PASSWORD nextcloud | gzip > db-dump.sql.gz
echo db dump finished.
