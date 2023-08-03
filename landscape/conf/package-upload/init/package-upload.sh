#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
/etc/init.d/landscape-package-upload start

# Keep container alive
tail -f /dev/null

