#!/usr/bin/env bash

SCRIPTDIR="/var/www/provision/"

source $SCRIPTDIR/install_mdk.sh
source $SCRIPTDIR/restore_snapshot.sh
source $SCRIPTDIR/configure_apache.sh