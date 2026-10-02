---
name: git-committing
description: Use when the user asks you to commit or prepare a commit — author profile check, GPG pre-check, commit message style
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
- **GPG pre-check (Work-IWF profile only):** the `m.vaccari@iwf.ch` key is passphrase-protected and
  the TUI can't render gpg's pinentry prompt, so a signed commit fails with
  `signing failed: No passphrase given`. When about to commit as Work-IWF and
  `git config --get commit.gpgsign` is `true`, first probe whether the passphrase is cached
  (no side effects — throwaway detached signature to /dev/null):

  ```sh
  echo probe | "$(git config --get gpg.program || echo gpg)" --pinentry-mode error --local-user "$(git config --get user.signingkey)" --detach-sign -o /dev/null 2>/dev/null; echo $?
  ```

  Exit `0` = cached → commit will succeed. Non-zero = do NOT commit; tell the user to cache the
  passphrase with a throwaway sign in their own terminal first.
- Commit messages: always Conventional Commits (`type: subject` — `feat`, `fix`, `chore`,
  `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `style`), subject line ≤80 characters
  (ticket prefix included). Say **what** changed, not why; staying general is fine.
  Title only, never a body/description — if a title can't convey everything a commit contains,
  the commit is too big: split it.
- **IWF repos** (remote `git.iwf.io` or `github.com/iwf-web`): prefix the ticket nr. whenever one is
  available, before the conventional type — `VOP-249 | refactor: take number formatters from the ci
  hooks`; no ticket → plain conventional commit (`chore: enable react compiler`).
- GitKraken stores its own copy of both identities (`~/.gitkraken/profiles/*/profile`) and ignores
  gitconfig for commits it creates. If an identity changes, it must be updated in `.gitconfig`,
  `.gitconfig-iwf`, AND both GitKraken profiles; GitKraken's "Keep my .gitconfig updated with my
  profile info" setting must stay off or it overwrites the dotfiles-managed gitconfig.
