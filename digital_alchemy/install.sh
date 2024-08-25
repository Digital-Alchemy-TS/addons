#!/bin/sh
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  NODE_VERSION=20.15.1
  apk add --no-cache curl
  curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz | tar -xJf - -C /usr/local --strip-components=1;
else
  apk add --no-cache curl nodejs npm
fi
npm i -g tsx nodemon
