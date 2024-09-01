# Encrypted Rsync over TLS with Stunnel

This configuration sets up an rsyncd server and an rsync client with an encrypted connection over TLS using Stunnel.

The rsyncd service listens on 127.0.0.1:873, and its traffic is securely forwarded by Stunnel to the remote port 22222.

Be sure to update the **RSYNCSRV** variable on ***rsync-client/docker-compose.yaml*** with the IP address or domain name of the rsyncd server.

## Synchronize files from the rsync client
```
rsync -avz PATHTOFILE rsync@127.0.0.1::rsyncd1
```
The above command can be translated as such: **[username]@[localhost:873]::ModuleName** . 

The ***ModuleName*** is defined in ***rsyncd.conf*** on the rsyncd server configuration.

## Certificates
Instructions on how to generate the SSL certificates can be found in [genkeys.tar.gz](https://github.com/psammarco/kubernetes/blob/master/relp-rsyslog/genkeys.tar.gz).
