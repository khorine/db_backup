#!/bin/sh

DB_USER="user"
DB_PASS="pass"
DB_NAME="dbname"

BACKUP_DIR="/path-to-backup"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mysqldump --user=$DB_USER --password=$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql
gzip $BACKUP_DIR/$DB_NAME-$DATE.sql

find $BACKUP_DIR -type f -name "*.gz" -mtime +3 -delete

