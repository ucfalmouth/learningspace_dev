## Snaphshot directory

If you have a snapshot of a live moodle installation (tarball of files/db.sql/data), just drop it in this directory.

If you just want to overwrite the database, just put the db.sql file here instead.

The snapshot will be extracted and imported on `vagrant up` or `vagrant provision`