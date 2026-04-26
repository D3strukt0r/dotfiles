#!/usr/bin/env bash
# Root bootstrap for GitHub Codespaces dotfiles integration.
# Codespaces probes the repo root for install.sh/bootstrap.sh/setup.sh; if
# none exists it symlinks every dotfile at the root into $HOME. This repo
# keeps configs under Linux/<host>/, so we provide an explicit entry point
# to preempt that fallback.
#
# Stub: intentionally does nothing yet. Wire this up by creating
# Linux/Codespaces/ (install.conf.yaml + per-host `install` following the
# pattern in macOS/Laptop-Work-IWF/install) and exec-ing it from here.
# Codespaces does a plain `git clone`, so the host script must run
# `git submodule update --init --recursive` before invoking dotbot.
#
# See: https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles

set -euo pipefail

echo "dotfiles: Codespaces bootstrap stub — no-op (see install.sh)"
