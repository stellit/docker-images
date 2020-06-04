FROM node:12.18.0-buster

LABEL MAINTAINER="stellit.woo@gmail.com"

ENV CHROME_BIN=/usr/bin/chromium-browser

# RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y install rpm

COPY apache-pulsar-client.rpm /workdir/pulsar-client.rpm
COPY apache-pulsar-client-devel.rpm /workdir/pulsar-client-dev.rpm

RUN rpm -ivh /workdir/pulsar-client.rpm
RUN rpm -ivh /workdir/pulsar-client-dev.rpm

RUN apt-get -y install chromium chromium-l10n fonts-wqy-zenhei ttf-dejavu

# CREATE workdir
RUN mkdir -p /workdir

COPY package.json /workdir

WORKDIR /workdir

RUN npm install
