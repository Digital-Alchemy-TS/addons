#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

# Install user configured/requested packages
if bashio::config.has_value 'packages'; then
    apk update \
        || bashio::exit.nok 'Failed updating Alpine packages repository indexes'

    for package in $(bashio::config 'packages'); do
        apk add "$package" \
            || bashio::exit.nok "Failed installing package ${package}"
    done
fi

# Fetch configuration options
APP_ROOT=$(bashio::config 'app_root')
ENVIRONMENT=$(bashio::config 'environment')

function prepareStart() {
  if [[ -z $(jq -r '.scripts.start // empty' 'package.json') ]]; then
    bashio::exit.nok "No start script found in package.json"
  fi

  PACKAGE_NAME=$(jq -r '.name' package.json)
  bashio::log.info "Starting ${PACKAGE_NAME}..."
}

# Navigate to the app root
cd "${APP_ROOT}" || bashio::exit.nok "Could not navigate to application root: ${APP_ROOT}"
# Validate package.json exists
if [[ ! -f "package.json" ]]; then
  bashio::exit.nok "package.json not found in APP_ROOT: '${APP_ROOT}'"
fi

if [[ "${ENVIRONMENT}" == "node_npm" ]]; then
  bashio::log.info "Installing dependencies..."
  if [[ -f "package-lock.json" ]]; then
    npm ci
  else
    npm install
  fi
  
  prepareStart
  bashio::log.info "  ...running npm start"
  
  npm start
elif [[ "${ENVIRONMENT}" == "node_yarn" ]]; then
  bashio::log.info "Installing dependencies..."
  yarn install
  
  prepareStart
  bashio::log.info "  ...running yarn start"
  yarn start
elif [[ "${ENVIRONMENT}" == "bun" ]]; then
  bashio::log.info "Installing dependencies..."
  bun install --frozen-lockfile --production
  
  prepareStart
  bashio::log.info "  ...running bun run start"
  bun run start
fi
