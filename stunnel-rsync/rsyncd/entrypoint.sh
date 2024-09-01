#!/bin/bash

# Starting rsyncd
/usr/bin/rsync --daemon --config=/etc/rsyncd.conf

# Starting Stunnel
/usr/bin/stunnel /etc/stunnel/stunnel.conf

# keep alive
sleep infinity
