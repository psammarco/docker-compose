#!/bin/bash


# ----------------------------------------------------------
# Applying global settings 
# ----------------------------------------------------------

# Make sure permissions are correct
chmod 644 /etc/landscape/service.conf

# Enable specified service for running
sed -i 's,RUN_'"${SERVICE}"'="no",RUN_'"${SERVICE}"'="yes",g' /etc/default/landscape-server
printf "Service ${SERVICE} enabled.\n"

# ----------------------------------------------------------
# Start rsyslog daemon
# ----------------------------------------------------------

# Fixing logs permission
chown -R landscape:landscape /var/log/landscape
chown -R syslog:landscape /var/log/landscape-server

printf "Starting rsyslogd\n"
# starting as non-interactive mode will fail
# seems to be a bug with rsyslogd itself
rsyslogd -f /etc/rsyslog.conf -n -iNONE &

# ----------------------------------------------------------
# Start postfix mail server 
# ----------------------------------------------------------
/etc/init.d/postfix start
