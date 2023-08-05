FROM landscape-app-server:latest 

ENV DEBIAN_FRONTEND=noninteractive

# Copying component startup script 
ARG BUILD=message-server
ENV BUILD=$BUILD

COPY $BUILD/init/$BUILD.sh /scripts

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/scripts/defaults.entrypoint.sh && /scripts/$BUILD.sh"]
