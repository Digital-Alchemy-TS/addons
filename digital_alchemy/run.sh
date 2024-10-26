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
APP_MAIN=$(bashio::config 'main')
RUN_MODE=$(bashio::config 'run_mode')

# Navigate to the app root
cd "${APP_ROOT}" || bashio::exit.nok "Could not navigate to application root: ${APP_ROOT}"
# Validate package.json exists
if [[ ! -f "package.json" ]]; then
  bashio::exit.nok "package.json not found in APP_ROOT:'${APP_ROOT}'"
fi

 if [[ "${RUN_MODE}" == "bun" ]]; then
  # npm install -g bun
  bun --version
  bun install
  bun run "$APP_MAIN"
else
  corepack enable && corepack prepare yarn@stable --activate
  yarn config set compressionLevel mixed
  yarn config set nodeLinker node-modules
  yarn install

  # Extract package name from package.json
  PACKAGE_NAME=$(jq -r '.name' package.json)
  bashio::log.info "Starting ${PACKAGE_NAME}..."

  # Check run_mode and execute the corresponding command
  if [[ "${RUN_MODE}" == "tsx" ]]; then
    npx tsx "$APP_MAIN"
  else
    node "$APP_MAIN"
  fi
fi
