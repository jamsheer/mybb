#!/bin/bash

echo $MYBB_ADMINEMAIL
echo $MYBB_DOMAINNAME
echo $MYBB_DBPASSWORD
echo $MYBB_SERVER

WEB="/var/www/html"
SRC="/tmp/mybb/Code"

cp "$SRC"/* "$WEB"/

sed -e "s/MYBB_ADMINEMAIL/${MYBB_ADMINEMAIL}/g" \
    -e "s/MYBB_DOMAINNAME/${MYBB_DOMAINNAME}/g" \
    "${SRC}/settings.php" > "${WEB}/inc/settings.php"

sed -e "s/MYBB_DBPASSWORD/${MYBB_DBPASSWORD}/g" \
    -e "s/MYBB_SERVER/${MYBB_SERVER}/g" \
    "${SRC}/config.php" > "${WEB}/inc/config.php"


cd "$WEB"
chmod 555 inc/config.php inc/settings.php
chmod 555 inc/languages/english/*.php inc/languages/english/admin/*.php
chmod 777 cache/ cache/themes/ uploads/ uploads/avatars/ admin/backups/

