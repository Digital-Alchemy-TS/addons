#!/bin/sh
set -e

apk add --no-cache curl unzip libstdc++ libgcc

# Install Bun onto PATH for the add-on runtime (non-login shell).
BUN_INSTALL=/usr/local
export BUN_INSTALL
curl -fsSL https://bun.sh/install | bash

# Alpine-packaged Node — both arches, security updates via apk.
# Needed for run_mode=node|tsx (and corepack/yarn).
apk add --no-cache nodejs npm

# Skip registry versions published in the last 48 hours (supply-chain cooldown).
# --before works on Alpine's npm; min-release-age needs npm 11.10+.
BEFORE=$(node -e 'console.log(new Date(Date.now() - 48 * 60 * 60 * 1000).toISOString())')
npm i -g corepack tsx --before="$BEFORE"
