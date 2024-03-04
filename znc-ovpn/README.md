# ZNC bouncer over OpenVPN
This Docker Compose automation deploys the famous ZNC IRC bouncer to route all its traffic through OpenVPN.

## Quick Breakdown
+ A no-login admin account is created.
+ *"admin ALL=(admin) NOPASSWD: /usr/bin/znc"* is added to sudoers.
+ The tun device is made available *(see entrypoint.sh)*.
+ "INTERFACE=tun0" in deployment.yaml ensures that all container traffic is routed through the VPN interface.
+ OpenVPN is started.
+ ZNC is executed as the admin user.

## ZNC Configurations
+ ZNC port is set to 6501.
+ Default username and password is *admin*. Change it immediately!
+ Access to ZNC from outside of the host is blocked due to the container routing all traffic through tun0.
    - To make ZNC accessible from another client, you need a NAT port forward rule such as:
 ```
  sudo iptables -t nat -A PREROUTING -p tcp --dport 6501 -j DNAT --to-destination CLIENTIP:6501
  sudo iptables -t nat -A POSTROUTING -j MASQUERADE
  ```
    
  You should now be able to access ZNC via DOCKER_HOST_IP:6501.

## Final Notes
The OpenVPN client config provided in example.ovpn is meant to be an example only, and no credentials are provided. I am not the owner of the VPN service nor do I have access to it. Again, it is provided merely as an example. You will need to arrange your own VPN access.
Once you do, make sure the correct OpenVPN ports are exposed both in the Dockerfile and deployment.yaml.
