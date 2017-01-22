#!/bin/bash

echo $MYBB_ADMINEMAIL
echo $MYBB_DOMAINNAME
echo $MYBB_DBPASSWORD
echo $MYBB_SERVER

WEB="/var/www/html"
SRC="/tmp/mybb/Code"

cp "$SRC"/* "$WEB"/
cd "$WEB"
mv inc/config.default.php inc/config.php
chmod -R 0777 cache uploads inc/settings.php inc/config.php
chmod 777 admin/backups/

