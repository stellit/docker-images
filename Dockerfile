FROM node:12.18.4-stretch

RUN mkdir /workdir
COPY ./package.json /workdir/
WORKDIR /workdir

RUN cd /workdir
RUN npm install
