#!/bin/sh
ARCH=$(uname -m)

## 1) Bun
# See issue for details on why this exists / when it will be replaced with something more sane
# https://github.com/oven-sh/bun/issues/5545#issuecomment-1722461083
if [ "$(uname -m)" = "aarch64" ]; then
  # aarch64
  wget https://raw.githubusercontent.com/squishyu/alpine-pkg-glibc-aarch64-bin/master/glibc-2.26-r1.apk
  apk add --no-cache --allow-untrusted --force-overwrite glibc-2.26-r1.apk
  rm glibc-2.26-r1.apk
else
  # x86_64
  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
  wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
  apk add --no-cache --force-overwrite glibc-2.28-r0.apk
  rm glibc-2.28-r0.apk
fi

## 2) Node
if [ "$ARCH" = "x86_64" ]; then
  NODE_VERSION=22.10.0
  apk add --no-cache curl
  curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz | tar -xJf - -C /usr/local --strip-components=1;
else
  apk add --no-cache curl nodejs npm
fi

## 3) Install runtimes
npm i -g tsx nodemon bun
