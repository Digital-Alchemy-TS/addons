#!/bin/sh
apk add --no-cache curl
NODE_VERSION=20.15.1
if [ "${BUILD_ARCH}" = "amd64" ]; then
  # must use this elsewhere
  curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz | tar -xJf - -C /usr/local --strip-components=1;
else
  # only installs node20 on arm
  apk add --no-cache curl nodejs npm
fi
npm i -g tsx nodemon
