#!/usr/bin/env bash

# WEBROOT="/var/www/public"
# TEMP="/var/www/temp"
# PLUGINS="/var/www/plugins"
VERSION="MOODLE_27_STABLE"


mkdir -p /var/www/temp
cp /var/www/public/config.php /var/www/temp

echo "backuping pre-upgrade webroot (to temp folder).."
tar -pcvzf /var/www/temp/webroot.tar /var/www/public
echo "removing webroot files.."
rm -rf /var/www/public/*
# ensure any hidden files also gone
rm -rf /var/www/public/.*

echo "cloning moodle core ($VERSION).."
git clone https://github.com/moodle/moodle.git /var/www/public
# would clone single branch, but gitversion in scotchbox does not seem to support this
# git clone https://github.com/moodle/moodle.git --branch $VERSION --single-branch /var/www/public
echo "selecting "$VERSION
cd /var/www/public
git checkout $VERSION
# remove git repo 
rm -rf .git

echo "restoring site configuration.."
cp /var/www/temp/config.php /var/www/public

echo "updating plugins.."
cp -R /var/www/plugins/$VERSION/mod/* /var/www/public/mod
cp -R /var/www/plugins/$VERSION/blocks/* /var/www/public/blocks
cp -R /var/www/plugins/$VERSION/enrol/* /var/www/public/enrol
cp -R /var/www/plugins/$VERSION/local/* /var/www/public/local

rm /var/www/data/temp

echo "running moodle upgrade script..."
php /var/www/public/admin/cli/upgrade.php --non-interactive
