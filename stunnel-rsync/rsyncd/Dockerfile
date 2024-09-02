FROM debian:stable-slim 
ENV DEBIAN_FRONTEND=noninteractivie

# Installing PREREQs
RUN apt update && apt upgrade -y
RUN apt install --no-install-suggests -y \
rsync \
stunnel \
libcap2-bin

# Cleaning up apt stuff..
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create unprivileged user
RUN groupadd -g 1000 rsyncd && \
    useradd -r -m -u 1000 -s /bin/bash -g rsyncd rsync && \
    chown -R rsync:rsyncd /home/rsync

# Sorting rsync structure directories and permissions
RUN mkdir -p /home/rsync/data/rsyncd1 /home/rsync/data/rsyncd2 \
    /var/log/rsyncd /var/run/rsyncd && \
    chown -R rsync:rsyncd /var/log/rsyncd /var/run/rsyncd /home/rsync/data

# Fixes "@ERROR: setgroups failed" when running rsyncd as user
RUN setcap cap_setgid=+ep /usr/bin/rsync

# Expose Rsyncd's stunnel port
EXPOSE 22222/tcp

# Entrypoint copy and permissions
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

