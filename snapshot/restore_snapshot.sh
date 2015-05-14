#!/usr/bin/env bash

# if only one file (original index)
# FILECOUNT=$(find /var/www/public ! -name '.*' -type f | wc -l)
# if [ ! -d "/var/www/public/scotchbox" ] && [ "$FILECOUNT" -eq 1 ]; then
#   echo "scotchbox index moved to /scotchbox"
#   mkdir -p /var/www/public/scotchbox
#   mv -u /var/www/public/index.php /var/www/public/scotchbox
# fi

echo "snapshot restoration is go"
cd /var/www/snapshot


echo "removing previous snapshot..."
rm -rf /var/www/data
rm -rf /var/www/public/*
rm -rf /var/www/snapshot/files
rm -rf /var/www/snapshot/db.sql
rm -rf /var/www/snapshot/data


echo "extracting snapshot..."
# rm -rf /var/www/snapshot/files
# rm -rf /var/www/snapshot/db.sql
# rm -rf /var/www/snapshot/data
# extract (most recent) snapshot file
snapshot_file=$(find snapshot_* | tail -1)
tar -pxzf $snapshot_file

mv -f files/* /var/www/public

# overwrite moodle config file
cp -f /var/www/snapshot/config.php /var/www/public/config.php

# construct data root
echo "constructing data..."
mkdir -p /var/www/data
mv -u /var/www/snapshot/data/* /var/www/data
rm -rf /var/www/data/cache/*
rm -rf /var/www/data/sessions/*

echo "importing database..."
mysql -u root --password=root -e "DROP DATABASE scotchbox"
mysql -u root --password=root -e "CREATE DATABASE scotchbox"
mysql -u root -proot scotchbox < /var/www/snapshot/db.sql
# mysql -u root -proot scotchbox < /var/www/snapshot/scotchbox.sql
# mysqldump -u root -proot scotchbox > /var/www/snapshot/scotchbox.sql

echo "snapshot restored"

mkdir -p /var/www/public/scotch
cp -u /var/www/scotchbox_index.php /var/www/public/scotch
# replace apache_run_user/group with vagrant to allow allow writing of session variables
cp /var/www/apache2.conf /etc/apache2
sudo /etc/init.d/apache2 restart
echo "learningspace_dev should be available at http://192.168.33.10/"

