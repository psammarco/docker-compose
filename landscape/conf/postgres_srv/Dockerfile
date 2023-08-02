FROM postgres:latest

RUN apt-get update && \
    apt-get install -y postgresql-plpython3-15 postgresql-15-debversion

# This value depends on hw and logging requests
# default value is 1024MB which is not enough for Landscape
#
#  initdb: error: directory "/var/lib/postgresql/data" exists but is not empty
#
#RUN echo "max_wal_size = 2048MB" >> /var/lib/postgresql/data/postgresql.conf
