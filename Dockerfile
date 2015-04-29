FROM debian:jessie
MAINTAINER Massimiliano Ravelli, massimiliano.ravelli@gmail.com

ENV CONFD_VERSION=0.9.0
ENV CONFD_MD5=008298b40143bc71581a84d854d154a6

RUN    apt-get update \
    && apt-get install -y curl python-jinja2 python-netaddr \
    && curl -L -s -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 \
    && echo "$CONFD_MD5 /usr/bin/confd" | md5sum -c - \
    && chmod 755 /usr/bin/confd \
    && apt-get --purge -y autoremove curl \
    && rm -rf /var/lib/apt/lists/*
