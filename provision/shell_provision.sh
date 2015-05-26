#!/usr/bin/env bash

SCRIPTDIR="/var/www/provision/"

# echo "Install mdk:"
# source $SCRIPTDIR/install_mdk.sh
echo "Restore snapshot:"
source $SCRIPTDIR/restore_snapshot.sh
echo "Set username:admin, password:password"
source $SCRIPTDIR/reset_admin.sh
echo "Configure apache for moodle:"
source $SCRIPTDIR/configure_apache.sh

cat $SCRIPTDIR/bash_profile.sh >> /home/vagrant/.bash_profile