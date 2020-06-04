FROM node:12.18.0-buster

LABEL MAINTAINER="stellit.woo@gmail.com"

ENV CHROME_BIN=/usr/bin/chromium-browser

# CREATE workdir
RUN mkdir -p /workdir

WORKDIR /workdir

# RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y install rpm

RUN curl "https://archive.apache.org/dist/pulsar/pulsar-2.5.2/RPMS/apache-pulsar-client-2.5.2-1.x86_64.rpm" -o /workdir/pulsar-client.rpm
RUN curl "https://archive.apache.org/dist/pulsar/pulsar-2.5.2/RPMS/apache-pulsar-client-devel-2.5.2-1.x86_64.rpm" -o /workdir/pulsar-client-dev.rpm

RUN rpm -ivh /workdir/pulsar-client.rpm
RUN rpm -ivh /workdir/pulsar-client-dev.rpm

RUN apt-get -y install chromium chromium-l10n fonts-wqy-zenhei ttf-dejavu
