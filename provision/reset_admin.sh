#!/usr/bin/env bash

# Set username:admin, password:password for id 2
mysql -u root --password=root -e "UPDATE mdl_user SET password='5f4dcc3b5aa765d61d8327deb882cf99', username='admin' WHERE id=2" scotchbox