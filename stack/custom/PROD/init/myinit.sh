#!/bin/bash
VERSIONINFO="20190419.1 PROD"
echo "Starting $0 v$VERSIONINFO"

APACHE_SERVICENAME="apache2"

#ps aux | grep -q "$APACHE_SERVICENAME"
service $APACHE_SERVICENAME status | grep -q "$APACHE_SERVICENAME is running"
if [ $? -eq 0 ]; then =
  echo "APACHE is running v$VERSIONINFO"
else 
  echo "APACHE is NOT running; starting it in 10 seconds... v$VERSIONINFO"
  sleep 10
  echo "APACHE is NOT running; starting it now"
  service $APACHE_SERVICENAME start
  sleep 10
  service $APACHE_SERVICENAME status | grep -q "$APACHE_SERVICENAME is running"
  if [ $? -eq 0 ]; then 
    echo "APACHE is now running"
  else
    echo "APACHE STILL NOT RUNNING! Trying again..."
    service $APACHE_SERVICENAME start
    sleep 15
    service $APACHE_SERVICENAME status | grep -q "$APACHE_SERVICENAME is running"
    if [ $? -eq 0 ]; then 
      echo "APACHE is finally running!"
    else
      echo "GIVING UP ON STARTING APACHE!  YOU MAY NEED TO START IT YOURSELF!"
    fi
  fi
fi

ps aux
service $APACHE_SERVICENAME status

#Make sure the webfiles are readable by apache
chgrp -R www-data /var/www/html/

#Place your preferred init content here
#a2enmod rewrite

#/usr/bin/nohup /usr/local/bin/mailhog &
/etc/init.d/postfix restart

echo "Now starting tail forever!"
echo "Finished $0 v$VERSIONINFO"
tail -f /dev/null