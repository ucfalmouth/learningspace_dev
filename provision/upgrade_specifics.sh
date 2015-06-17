#!/usr/bin/env bash

# Have the module updates run at this point?
echo "falmouth specific actions:"

echo "reset custom course format"
mysql -u root --password=root -e 'UPDATE mdl_course SET format="topics" WHERE format="topicsdeluxe"' scotchbox

echo "enable PHP debug.."
mysql -u root --password=root -e 'UPDATE mdl_config SET value = "30719" WHERE name = "debug"' scotchbox
mysql -u root --password=root -e 'UPDATE mdl_config SET value = "1" WHERE name = "debugdisplay"' scotchbox

echo "enable course content block on all courses"
mysql -u root --password=root -e 'INSERT INTO mdl_block_instances (blockname,parentcontextid,showinsubcontexts,pagetypepattern,subpagepattern,defaultregion,defaultweight,configdata) VALUES ("course_contents",1,1,"course-view-*",NULL,"side-pre",1,"")' scotchbox
echo "enable aspire reading list block on all courses"
mysql -u root --password=root -e 'INSERT INTO mdl_config_plugins (plugin, name, value) VALUES ("aspirelists", "targetAspire", "http://resourcelists.falmouth.ac.uk")' scotchbox
mysql -u root --password=root -e 'INSERT INTO mdl_block_instances (blockname,parentcontextid,showinsubcontexts,pagetypepattern,subpagepattern,defaultregion,defaultweight,configdata) VALUES ("aspirelists",1,1,"course-view-*",NULL,"side-pre",0,"")' scotchbox
