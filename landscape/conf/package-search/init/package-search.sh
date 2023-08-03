#!/bin/bash
#

# ----------------------------------------------------------
# Start core component
# ----------------------------------------------------------
printf " * Starting landscape-package-search\n"
/opt/canonical/landscape/go/bin/packagesearch -config /etc/landscape/service.conf

# Keep container alive
tail -f /dev/null

