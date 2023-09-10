FROM debian:stable-slim 

ENV DEBIAN_FRONTEND=noninteractive

# Installing PREREQs
RUN apt-get update && \
    apt-get install -y software-properties-common \
    iptables-persistent \
    apt-transport-https \
    nginx \
    curl
   
# Adding Tor apt repo  
RUN echo \ 
'deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bookworm main' > /etc/apt/sources.list.d/tor.list
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
RUN apt-get update

# Updating system packages and installing Tor
RUN apt-get dist-upgrade -y && \
    apt install -y tor deb.torproject.org-keyring \
    snowflake-client

# We want to use the good old iptables for our thing
RUN update-alternatives --set iptables /usr/sbin/iptables-legacy

# Tor configuration files 
RUN mv /etc/tor/torrc /etc/tor/torrc.defaults
COPY torrc /etc/tor
COPY init/ /scripts

# Setup nginx to run as debian-tor
RUN sed -i 's/www-data/debian-tor/g' /etc/nginx/nginx.conf

# Enable hidden website in nginx 
COPY hiddenwww.conf /etc/nginx/sites-available/www
RUN ln -s /etc/nginx/sites-available/www /etc/nginx/sites-enabled/

# Dirty workaround!!! Landing page is temporarily copied into /scripts
# then moved to /var/lib/tor/www once tor daemon is started.
COPY index.html /scripts

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/scripts/entrypoint.sh"]


# Start container using the following command in order for iptables to work
# docker run -d --cap-add=NET_ADMIN --name hiddenwww hiddenwww;docker exec -it hiddenwww /bin/bash
# snowflake-client works well under Debian. 
