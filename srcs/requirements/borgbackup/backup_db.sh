#!/bin/bash

# Define variables

BACKUP_NAME="mysql_backup_$(date +%Y-%m-%d_%H-%M-%S)"

# Dump MySQL database to a temporary file

mysqldump -h mariadb -u $DB_USER -p"$DB_USER_PW" "$DB_NAME" > backup.sql

borg init --encryption=none "$BORG_REPO"

# Backup the temporary file using BorgBackup
borg create "$BORG_REPO::$BACKUP_NAME" backup.sql

# Remove the temporary file
rm backup.sql
wall "Backup created: $BACKUP_NAME"
