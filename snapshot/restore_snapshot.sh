#!/usr/bin/env bash

# if only one file (original index)
FILECOUNT=$(find /var/www/public ! -name '.*' -type f | wc -l)
if [ ! -d "/var/www/public/scotchbox" ] && [ "$FILECOUNT" -eq 1 ]; then
  echo "scotchbox index moved to /scotchbox"
  mkdir -p /var/www/public/scotchbox
  mv -u /var/www/public/index.php /var/www/public/scotchbox
fi

echo "snapshot restoration is go"
cd /var/www/snapshot

echo "extracting snapshot..."
# extract (most recent) snapshot file
snapshot_file=$(find snapshot_* | tail -1)
tar -pxzf $snapshot_file

mv -f files/* /var/www/public
# overwrite config file
mv -f /var/www/snapshot/config.php /var/www/public/config.php

# construct data root
if [ ! -d "/var/www/data" ] && [ "$FILECOUNT" -eq 1 ]; then
  mkdir -p /var/www/data
  # chmod 777 /var/tmp/data # temporary hack for permissions
  mv -u /var/www/snapshot/data/* /var/www/data
fi

mysql -u root --password=root scotchbox < db.sql

echo "snapshot restored"