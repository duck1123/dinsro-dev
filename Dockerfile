# FROM clojure
FROM theasp/clojurescript-nodejs:latest

LABEL maintainer="Duck Nebuchadnezzar <duck@kronkltd.net>"
MAINTAINER Duck Nebuchadnezzar <duck@kronkltd.net>

WORKDIR /usr/src/app

RUN apt update && apt install -y \
        chromium \
        && rm -rf /var/lib/apt/lists/*

RUN npm install -g karma-cli

ENV CHROME_BIN=/usr/bin/chromium
