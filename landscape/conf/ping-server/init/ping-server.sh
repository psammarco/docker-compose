#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-pingserver start

# Keep container alive
tail -f /dev/null

