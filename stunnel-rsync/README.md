# Encrypted Rsync over TLS with Stunnel

This configuration sets up an rsyncd server and an rsync client with an encrypted connection over TLS using Stunnel.

The rsyncd service listens on 127.0.0.1:1873, and its traffic is securely forwarded by Stunnel to the remote port 22222.

Be sure to update the **RSYNCSRV** variable on ***rsync-client/docker-compose.yaml*** with the IP address or domain name of the rsyncd server.

## Synchronize files from the rsync client
```
rsync -avz PATHTOFILE rsync@127.0.0.1::rsyncd1 --port=1873
```
The above command can be translated as such: **[username]@[localhost:873]::ModuleName** . 

The ***ModuleName*** is defined in ***rsyncd.conf*** on the rsyncd server configuration.

## Certificates
Examples on how to generate the SSL certificates can be found in [genkeys.tar.gz](https://github.com/psammarco/kubernetes/blob/master/relp-rsyslog/genkeys.tar.gz).

## Rsyncd as standard user
This configuration allows rsyncd to run as a standard user. Running rsyncd as a non-root user has some limitations, such as the inability to preserve file privileges, and that data can only be synced to directories where the ***rsync*** user has read write permissions."

To run rsync as root the following entries need to be removed/ changed from the configuration:

**rsyncd/Dockerfile**
```
libcap2-bin
RUN setcap cap_setgid=+ep /usr/bin/rsync
chown -R rsync:rsyncd /var/log/rsyncd /var/run/rsyncd 
```
**rsyncd/rsyncd.conf** ***(change to yes)***
```
use chroot = no
```
**rsyncd/entrypoint.sh**
```
su -c " " rsync
