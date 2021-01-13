FROM node:12.20.1-buster

RUN apt install apache-pulsar-client*.deb

RUN mkdir /workdir
COPY ./package.json /workdir/
WORKDIR /workdir

RUN cd /workdir
RUN npm install
