FROM ubuntu:24.04

#      _                                       _     _ _     _
#   __| | __ _  ___ _ __ ___   ___  _ __   ___| |__ (_) | __| |
#  / _` |/ _` |/ _ \ '_ ` _ \ / _ \| '_ \ / __| '_ \| | |/ _` |
# | (_| | (_| |  __/ | | | | | (_) | | | | (__| | | | | | (_| |
#  \__,_|\__,_|\___|_| |_| |_|\___/|_| |_|\___|_| |_|_|_|\__,_|
#

#  	Title:		Dockerfile - Web Proxy
#   Note:       Default config does NOT allow RFC1918 targets
#               Change conf/squid.conf
#
EXPOSE 3128/tcp

ENV SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/squid.conf /etc/squid/squid.conf
COPY --chmod=0755 entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
