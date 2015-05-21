#!/bin/bash

scotchbox_snapshot ()
{
  if [ "$1" == "help" ] || [ "$1" == "-h" ]; then
    echo "takes a moodle_dev snapshot of this vagrant instance"
    echo "this can then be shared with other moodle_dev users"
  else
        MDLFILES=/var/www/public
        MDLDATA=/var/www/data
        MDLDB=scotchbox
        EXPORTDATE=$(date +"%m_%d_%Y")
        mkdir -p /var/www/snapshot_$EXPORTDATE

        echo "copying web root..."
        cp -R $MDLFILES /var/www/snapshot_$EXPORTDATE/files
        rm -rf /var/www/snapshot_$EXPORTDATE/files/.git
        echo "copying data root..."
        cp -R $MDLDATA /var/www/snapshot_$EXPORTDATE/data
        echo "exporting database..."
        mysqldump -uroot -proot $MDLDB > /var/www/snapshot_$EXPORTDATE/db.sql
        cd /var/www/snapshot_$EXPORTDATE
        echo "compressing snapshot..."
        tar -pcvzf snapshot_$EXPORTDATE.tar files data db.sql
        echo "complete"
  fi
}