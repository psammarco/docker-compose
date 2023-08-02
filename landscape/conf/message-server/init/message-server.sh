#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
python3 /opt/canonical/landscape/message-server --rundir=/opt/canonical/landscape \
--pidfile=/var/run/landscape/landscape-message-server-1.pid

# Keep container alive
tail -f /dev/null

