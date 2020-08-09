FROM node:14.7.0-alpine3.12

ENV CHROME_BIN=/usr/bin/chromium-browser
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

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

RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-2.6.0-1.x86_64.rpm
RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-devel-2.6.0-1.x86_64.rpm

RUN rpm -ivh apache-pulsar-client*.rpm
RUN mkdir /workdir
COPY package.json /workdir
WORKDIR /workdir

RUN npm install
