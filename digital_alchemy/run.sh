#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

# Fetch configuration options
APP_ROOT=$(bashio::config 'app_root')
APP_MAIN=$(bashio::config 'main')
APP_ENV=$(bashio::config 'node_env')

# Navigate to the app root
cd "${APP_ROOT}" || bashio::exit.nok "Could not navigate to application root: ${APP_ROOT}"
# Validate package.json exists
if [[ ! -f "package.json" ]]; then
  bashio::exit.nok "package.json not found in ${APP_ROOT}"
fi

corepack enable && corepack prepare yarn@stable --activate
yarn config set compressionLevel mixed
yarn config set nodeLinker node-modules
yarn install

# Extract package name from package.json
PACKAGE_NAME=$(jq -r '.name' package.json)
bashio::log.info "Starting ${PACKAGE_NAME}..."

NODE_ENV="$APP_ENV" node "$APP_MAIN"
