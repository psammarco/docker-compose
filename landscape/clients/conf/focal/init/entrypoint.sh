#!/bin/bash
#

# ----------------------------------------------------------
# Start landscape-client daemon  
# ----------------------------------------------------------
#/etc/init.d/landscape-client start

# ----------------------------------------------------------
# Setup client configuration 
# ----------------------------------------------------------
#landscape-config --computer-title "focal" --account-name standalone \
#--url https://"$FRONTEND"/message-system --ping-url http://"FRONTEND"/ping \
#--script-users=ALL --ok-no-register --silent


# Keep contain alive
tail -f /dev/null
