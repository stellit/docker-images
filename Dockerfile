FROM node:12.20.1-stretch


RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.4.0/DEB/apache-pulsar-client.deb
RUN wget https://archive.apache.org/dist/pulsar/pulsar-2.4.0/DEB/apache-pulsar-client-dev.deb

RUN apt install ./apache-pulsar-client*.deb

RUN mkdir /workdir
COPY ./package.json /workdir/
WORKDIR /workdir

RUN cd /workdir
RUN npm install
