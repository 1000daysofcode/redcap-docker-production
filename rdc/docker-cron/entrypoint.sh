#!/bin/sh

set -e

# ADD USERID TO MATCH APACHE
if [ ! -z "501" ]; then
  echo "IN HERE 501"
    if [ $(getent passwd "501" | cut -d: -f1) ]; then
        getent passwd "501" | cut -d: -f1
        echo "User ID 501 already exists"
    else
        echo "Creating user ID 501 as cron-www-data"
        adduser --disabled-password --gecos --no-create-home --ingroup www-data --uid "501" cron-www-data
    fi
fi

sed -i 's|/html/|'/html/'|g' /var/spool/cron/crontabs/root

# Log Rotate throws an error if this file doesn't exist
touch /var/log/messages

# Start up the cronjobs
/usr/sbin/crond -f /var/spool/cron/crontabs
