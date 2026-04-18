# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot) (vendored as a git submodule at `dotbot/`). There is no build system, test suite, or linter — changes are validated by running the installer on the target host.

## Layout

Configurations are organized by OS, then by host:

- `Linux/<host>/` — e.g. `Gaming-PC`, `Small-Laptop`, `Steam-Deck`, `Pi-Hole`, `Pi-Ender3`, `Pi-HomeAssistant`
- `Windows/<host>/` — e.g. `Gaming-PC`, `Laptop-Manuele`, `Laptop-Robine`, `Robines-PC`
- `macOS/<host>/` — e.g. `Laptop-Manuele`, `Laptop-Work-IWF`, `Laptop-Robine`
- `Linux/General/`, `macOS/General/`, `General/` — shared config files referenced from per-host `install.conf.yaml` via relative paths (e.g. `../General/.config/nvim`, `../../General/.ssh/known_hosts`)
- `dotbot-plugins/flatpak.py` — custom dotbot plugin for Linux hosts
- `dotbot/` — upstream dotbot, as a submodule

Each populated host folder contains its own `README.md`, an `install.conf.yaml` (dotbot config), and an installer script (`install` on Unix, `install.ps1` on Windows). Package manifests live alongside (e.g. `Brewfile` on macOS; `packages.config`, `packages.json`, `scoop-apps.json` on Windows).

## Running the installer

Installers must be run from inside the specific host directory — they resolve `dotbot` via `../../dotbot` and use the host folder as `BASEDIR`.

- macOS / Linux: `cd <OS>/<host> && ./install`
- Windows: `cd <OS>/<host>; .\install.ps1` (requires `python` or `python3` on PATH)

Both scripts auto-sync and init the `dotbot` submodule before invoking `dotbot/bin/dotbot -d <host> -c install.conf.yaml`. Extra arguments are forwarded to dotbot.

## Editing conventions

- When adding a linked file that is shared across hosts, place it under the appropriate `General/` directory and reference it from `install.conf.yaml` using a relative `path:` (see `macOS/Laptop-Work-IWF/install.conf.yaml` for examples of `../General/...` and `../../General/...`).
- The repo uses [Conventional Commits](https://www.conventionalcommits.org/).
- `.editorconfig` governs whitespace.
