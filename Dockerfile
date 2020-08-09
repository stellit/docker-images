FROM node:14.7.0-alpine3.12

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

ENV CHROME_BIN=/usr/bin/chromium-browser

RUN apk add build-base rpm python3 python3-dev

RUN apk add --update --no-cache \
      chromium@edge \
      nss@edge \
      wqy-zenhei@edge \
      fontconfig ttf-dejavu
RUN apk add --update --no-cache \
      alpine-sdk@edge \
      libffi-dev@edge \
      openssl-dev@edge

RUN mkdir /workdir
WORKDIR /workdir
RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-2.6.0-1.x86_64.rpm
RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-devel-2.6.0-1.x86_64.rpm
RUN rpm -ivh apache-pulsar-client*.rpm
