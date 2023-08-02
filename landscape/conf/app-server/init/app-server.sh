#!/bin/bash

# ----------------------------------------------------------
# Start landcape-server schema 
# ----------------------------------------------------------

printf "Starting landcape-server setup\n"
/usr/bin/setup-landscape-server

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------

python3 /opt/canonical/landscape/landscape --rundir=/opt/canonical/landscape \
--pidfile=/var/run/landscape/landscape-appserver-1.pid

# Keep container alive
tail -f /dev/null
