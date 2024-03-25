#!/bin/bash

# This is a 'quick-fix' for mysql8 which uses a different password plugin (caching_sha2_password) instead of the old 
# (mysql_native_password).  Currently (10/2019) the mysqli interface in php doesn't support sha2 logins, so for 
# REDCap (and PHP) to be able to log in, we need to change the password plugin.                                                                         

set -e

echo '*****************************'
echo "Database name is redcap and current database user is redcap_user"

echo -e "Changing password plugin to mysql_native_password from sha2\n\t-> (PHP's mysqli interface does not support sha2 logins)"

echo "Updating time_zone to Europe/Berlin"

mysql -u root -proot -e "ALTER USER 'redcap_user'@'%' IDENTIFIED WITH mysql_native_password BY 'redcap_123';
                         ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
                         SET GLOBAL time_zone = 'Europe/Berlin';"

echo '*****************************'
