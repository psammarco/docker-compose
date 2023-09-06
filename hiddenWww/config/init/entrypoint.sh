#!/bin/bash

# ----------------------------------------------------------
# Start tor service 
# ----------------------------------------------------------
/etc/init.d/tor start

# ----------------------------------------------------------
# Move landing page to website dir 
# ----------------------------------------------------------
mkdir /var/lib/tor/hiddenservices/www
chown -R debian-tor:debian-tor /var/lib/tor/hiddenservices/www
mv /scripts/index.html /var/lib/tor/hiddenservices/www
# ----------------------------------------------------------
# Enable hiddenwww vhost
# ----------------------------------------------------------
a2dissite 000-default.conf
a2ensite hiddenwww.conf

# ----------------------------------------------------------
# Start httpd 
# ----------------------------------------------------------
/etc/init.d/apache2 start

# ----------------------------------------------------------
# ----------------------------------------------------------
# Keep the container alive 
# ----------------------------------------------------------
tail -f /dev/null
