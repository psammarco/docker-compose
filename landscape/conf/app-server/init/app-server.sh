#!/bin/bash

# ----------------------------------------------------------
# Start landcape-server schema 
# ----------------------------------------------------------
printf "Starting landcape-server setup\n"
/usr/bin/setup-landscape-server

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-appserver start

# Keep container alive
tail -f /dev/null