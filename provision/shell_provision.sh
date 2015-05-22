#!/usr/bin/env bash

SCRIPTDIR="/var/www/provision/"

echo "Install mdk:"
source $SCRIPTDIR/install_mdk.sh
echo "Restore snapshot:"
source $SCRIPTDIR/restore_snapshot.sh
echo "Configure apache for moodle:"
source $SCRIPTDIR/configure_apache.sh