#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-api start

# Keep container alive
tail -f /dev/null

