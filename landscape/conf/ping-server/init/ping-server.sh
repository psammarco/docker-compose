#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
python3 /opt/canonical/landscape/pingserver --rundir=/opt/canonical/landscape \
--pidfile=/var/run/landscape/landscape-pingserver-1.pid

# Keep container alive
tail -f /dev/null

