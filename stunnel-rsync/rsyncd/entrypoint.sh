#!/bin/bash

# Starting rsyncd as user
su -c "/usr/bin/rsync --daemon --config=/etc/rsyncd.conf" rsync

# Starting Stunnel
/usr/bin/stunnel /etc/stunnel/stunnel.conf

# keep alive
sleep infinity
