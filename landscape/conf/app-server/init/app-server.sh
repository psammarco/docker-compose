#!/bin/bash

# ----------------------------------------------------------
# Start landcape-server schema 
# ----------------------------------------------------------
printf " * Starting landcape-server setup\n"
/usr/bin/setup-landscape-server

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-appserver start


# ----------------------------------------------------------
# Start apache2 
# ----------------------------------------------------------
/usr/sbin/apachectl start

# Enabling apache modules
/usr/sbin/a2enmod proxy
/usr/sbin/a2enmod proxy_http
/usr/sbin/a2enmod headers
/usr/sbin/a2enmod expires
/usr/sbin/a2enmod rewrite

# Disabling default vhost
/usr/sbin/a2dissite 000-default

# Enabling landscape vhost
/usr/sbin/a2ensite landscape.conf

# ----------------------------------------------------------
# Restart apache2
# ----------------------------------------------------------
/usr/sbin/apachectl restart

# Keep container alive
tail -f /dev/null
