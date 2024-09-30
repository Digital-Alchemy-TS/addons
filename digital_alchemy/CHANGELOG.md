## 24.9.2

- Added support for adding additional Alpine packages (e.g. git) to the runner on startup.

## 24.9.1

- Added support for tsx runtime.

> ⚠️ node runtime is now legacy/deprecated, please update code

`@digital-alchemy` has internally converted to `esm` exports. This update provides a compatible code runner experience.

- [Updated deploy script](https://raw.githubusercontent.com/Digital-Alchemy-TS/haos-template/refs/heads/main/scripts/deploy.sh)
- [ESM Migration Guide](https://docs.digital-alchemy.app/esm-migration)

## 24.8.3

- getting it right

## 24.8.1

- add support for arm / raspberry pi devices

## 24.7.2

- add config for main
- add config for `NODE_ENV`

## 24.7.1

- Move from local addon to separate repo
- Adjust addon to run off `/share`
- Move from `node18` (default for image) to `node20.15.1`
