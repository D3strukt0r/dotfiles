---
name: git-committing
description: Use when the user asks you to commit or prepare a commit — author profile check, GPG signing, commit message style
---

# Committing

- Two author profiles, chosen by **where the repo is pushed, not who owns the work**:
  - `Manuele Vaccari <m.vaccari@iwf.ch>` for internal remotes (e.g. `git.iwf.io`)
  - `D3strukt0r <dev@d3strukt0r.dev>` for public remotes (GitHub, etc.)
- The gitconfig auto-selects the profile (`includeIf "hasconfig:remote.*.url:..."` in
  `~/.gitconfig` → `~/.gitconfig-iwf` for `git.iwf.io` remotes), so the configured author is
  normally already correct.
- Still verify before committing: the configured author (`git config user.name` / `user.email`)
  must match the repo's history (`git log --format='%an <%ae>'`) and push destination
  (`git remote -v` as tiebreaker). If it doesn't match, stop and say so — likely a repo-local
  override (`git config --show-origin user.email`) or an unmatched remote URL shape.
- **GPG signing (Work-IWF profile only):** the `m.vaccari@iwf.ch` key is passphrase-protected.
  `~/.gnupg/gpg-agent.conf` points the agent at GPG Suite's `pinentry-mac`, which takes the
  passphrase from the macOS Keychain without asking or opens a macOS dialog — both work from the
  TUI, so commit directly without probing the cache (a probe with `--pinentry-mode error` can't
  reach the Keychain and reports "not cached" falsely). If a commit still fails with
  `signing failed`, don't retry and never disable signing (`--no-gpg-sign`,
  `-c commit.gpgsign=false`); tell the user, they sign once in their own terminal and ask again.
- Commit messages: always Conventional Commits (`type: subject` — `feat`, `fix`, `chore`,
  `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `style`), subject line ≤80 characters
  (ticket prefix included). Say **what** changed, not why; staying general is fine.
  Title only, never a body/description — if a title can't convey everything a commit contains,
  the commit is too big: split it.
- **IWF repos** (remote `git.iwf.io` or `github.com/iwf-web`): prefix the ticket nr. whenever one is
  available, before the conventional type — `VOP-249 | refactor: take number formatters from the ci
  hooks`; no ticket → plain conventional commit (`chore: enable react compiler`). A shared library's
  commit gets the prefix too when it implements part of that ticket; only unticketed maintenance goes
  without.
- "Commit to branch" means: branch off the current branch, named per the repo's convention (IWF:
  `feature/<TICKET>_<kebab-slug>`), and commit there. A plain "commit" commits on the current branch
  as it is, even `develop` — never branch off on your own.
- GitKraken stores its own copy of both identities (`~/.gitkraken/profiles/*/profile`) and ignores
  gitconfig for commits it creates. If an identity changes, it must be updated in `.gitconfig`,
  `.gitconfig-iwf`, AND both GitKraken profiles; GitKraken's "Keep my .gitconfig updated with my
  profile info" setting must stay off or it overwrites the dotfiles-managed gitconfig.
