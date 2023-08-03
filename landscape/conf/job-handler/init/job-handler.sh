#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/opt/canonical/landscape/job-handler --rundir=/opt/canonical/landscape \
--pidfile=/var/run/landscape/landscape-job-handler-1.pid

# Keep container alive
tail -f /dev/null

