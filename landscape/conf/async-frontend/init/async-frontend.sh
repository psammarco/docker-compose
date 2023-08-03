#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-async-frontend start

# Keep container alive
tail -f /dev/null

