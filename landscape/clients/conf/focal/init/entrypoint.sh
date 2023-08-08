#!/bin/bash
#

# ----------------------------------------------------------
# Setup client configuration and start init service 
# ----------------------------------------------------------
landscape-config --computer-title "focal1" \
        --account-name standalone \
        --url http://"$FRONTEND"/message-system \
        --ping-url http://"$FRONTEND"/ping \
        --script-users=ALL \
        --ok-no-register \
        --tags=containers \
        --silent

# Keep contain alive
tail -f /dev/null
