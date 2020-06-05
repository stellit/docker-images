FROM node:11.11.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update --no-cache \
      chromium@edge \
      nss@edge \
      wqy-zenhei@edge \
      fontconfig ttf-dejavu

RUN apk add --update --no-cache \
      alpine-sdk@edge \
      libffi-dev@edge \
      openssl-dev@edge \
      build-base@edge

COPY apache-pulsar-client.rpm /workdir/pulsar-client.rpm
COPY apache-pulsar-client-devel.rpm /workdir/pulsar-client-dev.rpm

RUN rpm -ivh /workdir/pulsar-client.rpm
RUN rpm -ivh /workdir/pulsar-client-dev.rpm

COPY package.json /workdir

RUN npm install
