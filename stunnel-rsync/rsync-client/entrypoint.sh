#!/bin/bash

RSYNCSRV="${RSYNCSRV}"

# Injecting Rsync server's IP to stunnel.conf
sed -i 's/connect = /connect = '"$RSYNCSRV"'/g' /etc/stunnel/stunnel.conf

# Starting stunnel 
stunnel /etc/stunnel/stunnel.conf

# keep alive
sleep infinity
