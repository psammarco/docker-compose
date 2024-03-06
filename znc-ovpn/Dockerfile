FROM debian:stable-20240211-slim

# Environment settings
ARG DEBIAN_FRONTEND="noninteractive"

RUN echo "*** Installing openvpn + znc + extra ***"
RUN apt-get update && apt-get install -y \
iproute2 \
openvpn \
procps \
sudo \
znc

## Creating nologin user for znc
RUN echo "*** create nologin admin user ***"
RUN useradd -s /sbin/nologin -d /config admin 
##

# Allow user admin to exec znc using sudo  without being prompted for passwd
RUN echo "admin ALL=(admin) NOPASSWD: /usr/bin/znc" >> /etc/sudoers

# Must match both openvpn and znc config ports
EXPOSE 443/tcp 7770/tcp 8443/tcp 6501
VOLUME /config /startup

RUN mkdir /startup

# Setting up znc with basic config
RUN mkdir -p /config/configs
COPY znc.conf.d/znc.conf /config/configs
# Generates a pemfile for use with SSL 
RUN znc -p -d /config
#
COPY init.d/* /startup
RUN chown -R admin:admin /config

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/startup/entrypoint.sh"]
