## 26.8.5

- install Bun via the official installer and Alpine `nodejs`/`npm` on both arches
- remove glibc workarounds, unofficial Node musl builds, and unused global packages (`nodemon`, npm-installed `bun`)
- enforce a 48-hour minimum release age on registry installs (npm / Yarn / Bun)

## 26.8.4

- fix add-on `url` to point at `digital_alchemy/` (was a 404 for `code_runner/`)
- limit supported architectures to `aarch64` and `amd64`

## 25.7.1

- added `corepack` to dependencies installed

## 25.2.1

- set `bun` as default runtime
- update default entrypoint to `src/main.mts`

## 24.10.1

- bump `node20.15` to `node22.10` (x86)
- add experimental `bun` runtime support

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
