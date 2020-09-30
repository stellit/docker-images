FROM node:12.18.4-alpine3.12

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk


RUN apk add build-base rpm python3 python3-dev


RUN mkdir /workdir
COPY ./package.json /workdir/
WORKDIR /workdir

RUN cd /workdir
RUN npm install

RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-2.6.0-1.x86_64.rpm
RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/RPMS/apache-pulsar-client-devel-2.6.0-1.x86_64.rpm
RUN rpm -ivh apache-pulsar-client*.rpm
