#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-job-handler start

# Keep container alive
tail -f /dev/null

