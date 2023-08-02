FROM landscape-app-server:latest 

ENV DEBIAN_FRONTEND=noninteractive

# Copying landscape config files
ARG DEFAULTS=../app-server
ARG BUILD=ping-server

COPY $DEFAULTS/service.conf /etc/landscape
COPY $DEFAULTS/rsyslog.conf /etc
COPY $DEFAULTS/init/defaults.entrypoint.sh /scripts
COPY $BUILD/init/$BUILD.sh /scripts


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/scripts/defaults.entrypoint.sh && /scripts/ping-server.sh"]
