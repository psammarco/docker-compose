FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Setting variables for apache landscape conf
ENV DOMAIN=landscape.poc.null
ENV APPSERVER=172.10.0.40
ENV MSGSERVER=172.10.0.50
ENV PINGSERVER=172.10.0.60
ENV JOBHANDLER=172.10.0.70
ENV ASYNC_FRONTEND=172.10.0.80
ENV APISERVER=172.10.0.90
ENV PACKAGEUPLOADSERVER=172.10.0.100
ENV PACKAGESEARCH=172.10.0.110

# Installing PREREQs
RUN apt-get update && \
    apt-get install -y software-properties-common

# Installing landscape-server and components
RUN add-apt-repository -y ppa:landscape/self-hosted-23.03 && \
    apt-get update

RUN apt-get dist-upgrade -y && \
    apt-get install -y landscape-server apache2 ubuntu-minimal

# Creating logging structure
RUN mkdir /var/log/landscape-server
RUN mkdir /var/run/landscape
RUN touch /var/log/landscape-server/update-alerts.log \
      /var/log/landscape-server/process-alerts.log \
      /var/log/landscape-server/landscape-profiles.log \
      /var/log/landscape-server/sync_lds_releases.log \
      /var/log/landscape-server/landscape-setup.log \
      /var/log/landscape-server/maintenance.log \
      /var/log/landscape-server/update_security_db.log \
      /var/log/landscape-server/package-search.log \
      /var/log/landscape-server/appserver.log

# Adjusting permissions for init scripts
RUN chown -R landscape:landscape /var/run/landscape

# Copying landscape config files
COPY service.conf /etc/landscape
COPY rsyslog.conf /etc 
COPY init/ /scripts
COPY apache.conf /etc/apache2/sites-available/landscape.conf

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/scripts/defaults.entrypoint.sh && /scripts/app-server.sh"]
