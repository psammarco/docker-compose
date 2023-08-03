#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-msgserver start

# Keep container alive
tail -f /dev/null

