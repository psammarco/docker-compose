#!/bin/bash
#

# ----------------------------------------------------------
# Start landscape-client daemon  
# ----------------------------------------------------------
/etc/init.d/landscape-client start

# ----------------------------------------------------------
# Setup client configuration 
# ----------------------------------------------------------
landscape-config --computer-title "focal" --account-name standalone \
--url https://"$FRONTEND"/message-system --ping-url http://"FRONTEND"/ping


# Keep contain alive
tail -f /dev/null
