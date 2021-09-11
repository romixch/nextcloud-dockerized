#!/bin/bash

echo db dump read env

export $(cat db.env | xargs)

echo db dump started...
docker exec nextcloud-dockerized_db_1 /usr/bin/mysqldump -u root --password=$MYSQL_ROOT_PASSWORD nextcloud | gzip > db-dump.sql.gz
echo db dump finished.
