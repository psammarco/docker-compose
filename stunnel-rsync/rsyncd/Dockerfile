FROM debian:stable-slim 
ENV DEBIAN_FRONTEND=noninteractivie

# Installing PREREQs
RUN apt update && apt upgrade -y
RUN apt install --no-install-suggests -y \
cron \
stunnel \
rsync

# Cleaning up apt stuff..
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create unprivileged user
RUN groupadd -g 1000 rsyncd && \
    useradd -r -m -u 1000 -s /bin/bash -g rsyncd rsync && \
    chown -R rsync:rsyncd /home/rsync

# Backup folders
RUN mkdir -p /home/rsync/data/rsyncd1 && \
    mkdir -p /home/rsync/data/rsyncd2
RUN chown -R rsync:rsyncd /home/rsync/data


# Expose Rsyncd's stunnel port
EXPOSE 22222/tcp

# Entrypoint copy and permissions
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

