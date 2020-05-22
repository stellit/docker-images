FROM node:12.16.3-alpine

LABEL MAINTAINER="stellit.woo@gmail.com"

ENV CHROME_BIN=/usr/bin/chromium-browser
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk -U --no-cache update && apk -U --no-cache --allow-untrusted add \
      xorg-server \
      ttf-freefont \
      dbus \
      wqy-zenhei@edge \
      bash \
      bash-doc \
      bash-completion -f \
      zlib-dev \
      chromium@edge \
      nss@edge \
      wqy-zenhei@edge && \
    apk --update add fontconfig ttf-dejavu
