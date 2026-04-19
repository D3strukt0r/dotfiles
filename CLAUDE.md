# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot) (vendored as a git submodule at `dotbot/`). There is no build system, test suite, or linter — changes are validated by running the installer on the target host.

## Layout

Configurations are organized by OS, then by host:

- `Linux/<host>/` — e.g. `Gaming-PC`, `Small-Laptop`, `Steam-Deck`, `Pi-Hole`, `Pi-Ender3`, `Pi-HomeAssistant`
- `Windows/<host>/` — e.g. `Gaming-PC`, `Laptop-Manuele`, `Laptop-Robine`, `Robines-PC`
- `macOS/<host>/` — e.g. `Laptop-Manuele`, `Laptop-Work-IWF`, `Laptop-Robine`
- `Linux/General/`, `macOS/General/`, `Windows/General/`, `General/` — shared config files referenced from per-host `install.conf.yaml` via relative paths (e.g. `../General/.gitignore_global`, `../../General/.ssh/known_hosts`). Each OS has a single shared `.gitignore_global` under its `General/` directory.
- `dotbot-plugins/flatpak.py` — custom dotbot plugin for Steam-Deck
- `dotbot-plugins/crossplatform.py` — vendored + patched fork of [msdrigg/dotbot-crossplatform](https://github.com/msdrigg/dotbot-crossplatform) providing `crossplatform-link` and `crossplatform-shell` directives (path normalization + `platform:` filter). Vendored because upstream still references the old dotbot `_link_destination` attribute, which was renamed to `_link_target` in dotbot v1.23.0 — the local copy has that rename applied (4 call sites).
- `dotbot/` — upstream dotbot, as a submodule (pinned to `v1.24.1` or newer)

Each populated host folder contains its own `README.md`, an `install.conf.yaml` (dotbot config), and an installer script (`install` on Unix, `install.ps1` on Windows). Package manifests live alongside (e.g. `Brewfile` on macOS; `packages.config`, `packages.json`, `scoop-apps.json` on Windows).

## Running the installer

Installers must be run from inside the specific host directory — they resolve `dotbot` via `../../dotbot` and use the host folder as `BASEDIR`.

- macOS / Linux: `cd <OS>/<host> && ./install`
- Windows: `cd <OS>/<host>; .\install.ps1` (requires `python` or `python3` on PATH)

Both scripts auto-sync and init submodules before invoking `dotbot/bin/dotbot -d <host> -c install.conf.yaml`. Plugin loading is declared in each `install.conf.yaml` via a top-level `- plugins:` directive (e.g. `../../dotbot-crossplatform/` for Windows hosts, `../../dotbot-plugins/` for Steam-Deck's `flatpak:` directive) — not via CLI flags. Extra arguments are forwarded to dotbot.

## Editing conventions

- When adding a linked file that is shared across hosts, place it under the appropriate `General/` directory and reference it from `install.conf.yaml` using a relative `path:` (see `macOS/Laptop-Work-IWF/install.conf.yaml` for examples of `../General/...` and `../../General/...`).
- On Windows hosts, use the `crossplatform-link` directive (from `dotbot-crossplatform`) instead of plain `link` — it normalizes forward/backward slashes. macOS and Linux `install.conf.yaml` files use plain `link` today; prefer `crossplatform-link` for any new cross-OS shared directives.
- The repo uses [Conventional Commits](https://www.conventionalcommits.org/).
- `.editorconfig` governs whitespace.
