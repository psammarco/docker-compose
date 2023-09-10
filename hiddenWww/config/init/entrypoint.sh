#!/bin/bash

# ----------------------------------------------------------
# Start tor service 
# ----------------------------------------------------------
/etc/init.d/tor start

# ----------------------------------------------------------
# Move landing page to website dir 
# ----------------------------------------------------------
mkdir /var/lib/tor/main/hiddenservices/www
chown -R debian-tor:debian-tor /var/lib/tor/main/hiddenservices/www
mv /scripts/index.html /var/lib/tor/main/hiddenservices/www

# ----------------------------------------------------------
# Start nginx 
# ----------------------------------------------------------
/etc/init.d/nginx start

# ----------------------------------------------------------
# ----------------------------------------------------------
# Keep the container alive 
# ----------------------------------------------------------
tail -f /dev/null
