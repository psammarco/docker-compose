FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ARG FRONTEND=172.100.0.10
ENV FRONTEND=$FRONTEND

RUN apt-get update && \
    apt-get install -y landscape-client


COPY init/ /scripts

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/scripts/entrypoint.sh"]
