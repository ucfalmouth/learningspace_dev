#!/usr/bin/env bash

database_import ()
{
  echo "importing database..."
  mysql -u root --password=root -e "DROP DATABASE scotchbox"
  mysql -u root --password=root -e "CREATE DATABASE scotchbox"
  mysql -u root -proot scotchbox < /var/www/snapshot/db.sql
}
moodle_config ()
{
  # overwrite moodle config file
  cp -f /var/www/provision/config.php /var/www/public/config.php
}
remove_existing_site ()
{
  echo "deleting existing site files and data directory..."
  rm -rf /var/www/data
  rm -rf /var/www/public
  mkdir -p /var/www/public
}
extract_snapshot ()
{
  echo "removing previous snapshot files..."
  rm -rf /var/www/snapshot/files
  rm -rf /var/www/snapshot/db.sql
  rm -rf /var/www/snapshot/data    
  echo "extracting snapshot..."    
  # extract (most recent) snapshot file
  snapshot_file=$(find /var/www/snapshot/snapshot_* | tail -1)
  tar -pxzf $snapshot_file
  mkdir -p /var/www/snapshot/imported_snapshots
  mv $snapshot_file /var/www/snapshot/imported_snapshots
}
create_data_root ()
{
  echo "populating data root..."
  mkdir -p /var/www/data
  cp -rf /var/www/snapshot/data /var/www
  rm -rf /var/www/data/cache/*
  rm -rf /var/www/data/sessions/*
}
create_system_files ()
{
  echo "populating files..."
  cp -fr /var/www/snapshot/files/* /var/www/public
}
flush_import_snapshot ()
{ 
  remove_existing_site
  create_data_root
  create_system_files
  database_import
  moodle_config
  echo "snapshot restored"
}
git_get_snapshot () 
{
  echo "downloading blank moodle snapshot"
  rm -rf /var/www/snapshot
  # clone single branch (not working in this git version)
  # git clone -b m29 --single-branch https://github.com/ucfalmouth/moodle_snapshots.git /var/www/snapshot
  git clone https://github.com/ucfalmouth/moodle_snapshots.git /var/www/snapshot
  cd /var/www/snapshot
  echo "selecting $1..."
  git checkout $1
}

# Is there a tarball snapshot present?
SNAPSHOTCOUNT=$(find /var/www/snapshot -name 'snapshot_*' -type f -maxdepth 1 -nowarn | wc -l)

# Snapshot components present?
DBEXPORT=$(find /var/www/snapshot -name 'db.sql' -type f -nowarn | wc -l)
FILESEXPORT=0
DATAEXPORT=0
if [ -d "/var/www/snapshot/files" ]; then
  FILESEXPORT=$(ls /var/www/snapshot/files | wc -l)
  if [ "$FILESEXPORT" -gt 0 ]; then
    FILESEXPORT=1
  fi
fi
if [ -d "/var/www/snapshot/data" ]; then
  DATAEXPORT=$(ls /var/www/snapshot/data | wc -l)
  if [ "$DATAEXPORT" -gt 0 ]; then
    DATAEXPORT=1
  fi
fi
echo "snapshot $SNAPSHOTCOUNT, db $DBEXPORT, files $FILESEXPORT, data $DATAEXPORT"

if [ "$SNAPSHOTCOUNT" -ge 1 ]; then
 	echo "snapshot found"
	echo "snapshot restoration is go"
	cd /var/www/snapshot

  if [ "$DBEXPORT" -eq 0 ] && [ "$FILESEXPORT" -eq 0 ] && [ "$DATAEXPORT" -eq 0 ]; then
    echo "snapshot found but has not been extracted"
    extract_snapshot
    flush_import_snapshot
  else
    if [ "$DBEXPORT" -eq 1 ] && [ "$FILESEXPORT" -eq 0 ] && [ "$DATAEXPORT" -eq 0 ]; then
      echo "snapshot present but database file takes precedence"
      echo "database import only"
      database_import
    else
      echo "Snapshot exists but there are also files/data directories"
      if [ "$DBEXPORT" -eq 1 ] && [ "$FILESEXPORT" -eq 1 ] && [ "$DATAEXPORT" -eq 1 ]; then
        echo "snapshot found (already extracted)"
        flush_import_snapshot
      else
        # assume just detritus
        extract_snapshot
        flush_import_snapshot
      fi
    fi
  fi
else
  # No snapshot.tar
  if [ "$DBEXPORT" -eq 1 ] && [ "$FILESEXPORT" -eq 1 ] && [ "$DATAEXPORT" -eq 1 ]; then
    echo "snapshot found (already extracted)"
    flush_import_snapshot
  else
    echo "no snapshot found"
    if [ "$DBEXPORT" -eq 1 ]; then
      echo "database export found"
      echo "database import only"
      database_import
    else
      echo "no snapshot found"
      git_get_snapshot m29
      extract_snapshot
      flush_import_snapshot
      # git clone -b mybranch --single-branch git://sub.domain.com/repo.git
    fi
  fi
fi

# if only one file (original index)
# FILECOUNT=$(find /var/www/public ! -name '.*' -type f | wc -l)
# if [ ! -d "/var/www/public/scotchbox" ] && [ "$FILECOUNT" -eq 1 ]; then
#   echo "scotchbox index moved to /scotchbox"
#   mkdir -p /var/www/public/scotchbox
#   mv -u /var/www/public/index.php /var/www/public/scotchbox
# fi

# echo "importing database..."
# mysql -u root --password=root -e "DROP DATABASE scotchbox"
# mysql -u root --password=root -e "CREATE DATABASE scotchbox"
# mysql -u root -proot scotchbox < /var/www/snapshot/db.sql
# mysql -u root -proot scotchbox < /var/www/snapshot/scotchbox.sql
# mysqldump -u root -proot scotchbox > /var/www/snapshot/scotchbox.sql

# mkdir -p /var/www/public/scotch
# cp -u /var/www/provision/scotchbox_index.php /var/www/public/scotch/index.php
