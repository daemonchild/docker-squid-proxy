FROM ubuntu:16.04

#      _                                       _     _ _     _
#   __| | __ _  ___ _ __ ___   ___  _ __   ___| |__ (_) | __| |
#  / _` |/ _` |/ _ \ '_ ` _ \ / _ \| '_ \ / __| '_ \| | |/ _` |
# | (_| | (_| |  __/ | | | | | (_) | | | | (__| | | | | | (_| |
#  \__,_|\__,_|\___|_| |_| |_|\___/|_| |_|\___|_| |_|_|_|\__,_|
#

#  	Title:		Dockerfile - Bounce Proxy
#

ENV SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
COPY conf/squid.conf /etc/squid/squid.conf
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]