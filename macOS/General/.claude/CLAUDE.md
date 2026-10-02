# Git

Never modify git state unless I explicitly instruct you to — no commit, stage, reset, checkout, branch, push, stash, tag, rebase, or any other mutating git command.
Reading git (status, log, diff, show, blame, etc.) is always fine.

I review your output by staging the files I've approved.
Never stash — `git stash` (especially with untracked files) wipes out unstaged work in progress and I lose hours of progress that I cannot recover.
If you ever think stashing is needed, stop and ask me instead.

I stage, unstage and reset between turns, so a status from an earlier turn is stale.
Immediately before a commit, check `git diff --cached --stat` in the same command; before a reset, check `git log`/`git reflog` and that HEAD is the commit you expect.

In a staged build, a finished and applied step gets its commit before the next step starts: present the commit message and stop there, rather than researching or writing the next step while the finished one is uncommitted.
I lift this explicitly for a piece of work I want committed as one.

Plan and roadmap files are scratch for surviving context compaction: never stage or commit them, and don't mention them in committed docs.

## Author profile check before committing

I use two git author profiles.
Which one applies depends on **where the repo is pushed, not who owns the work**:
internal stuff (e.g. the remote `git.iwf.io`) uses the Work-IWF profile;
anything public (GitHub, etc.) uses the Personal profile.
My two profiles are:

- **Personal** — `D3strukt0r` `<dev@d3strukt0r.dev>` — for public remotes (GitHub, etc.)
- **Work-IWF** — `Manuele Vaccari` `<m.vaccari@iwf.ch>` — for internal remotes (e.g. `git.iwf.io`)

My gitconfig auto-selects the profile:
`includeIf "hasconfig:remote.*.url:..."` sections at the bottom of `~/.gitconfig` switch to Work-IWF for any repo with a `git.iwf.io` remote (identity in `~/.gitconfig-iwf`);
everything else defaults to Personal.
So the configured author is normally already correct.

GitKraken keeps its **own copy** of both identities in `~/.gitkraken/profiles/*/profile` and ignores gitconfig entirely for commits it creates (it uses libgit2, which doesn't support the `hasconfig` includeIf).
Keep GitKraken's Preferences → Profiles → "Keep my .gitconfig updated with my profile info" toggle OFF in both profiles — when on, a profile switch overwrites the dotfiles-managed `~/.gitconfig`.
If an identity ever changes, update it in all three places: `.gitconfig`, `.gitconfig-iwf`, and both GitKraken profiles.

Still, when I tell you to commit, verify as a safety net: check which author I've committed as in this repo historically (`git log --format='%an <%ae>'` and look at the recent/dominant author) and compare it against the currently configured author (`git config user.name` / `git config user.email`);
the `git remote -v` destination is the tiebreaker when there's no history.
If the current profile doesn't match the one this repo should use, do NOT commit — stop and tell me.
A mismatch now most likely means a repo-local override (`git config --show-origin user.email` reveals the source) or a remote URL shape the includeIf patterns don't cover.
Only commit when the current author matches the repo's established/destination-appropriate author (or the repo has no prior commits to infer from).

## GPG passphrase pre-check before committing (Work-IWF only)

The Work-IWF key (`Manuele Vaccari <m.vaccari@iwf.ch>`) is passphrase-protected, and the Claude Code TUI can't render gpg's pinentry prompt — so a signed commit needing the passphrase fails with `signing failed: No passphrase given` and I can't type it in.
This only affects the Work-IWF profile.

So, when about to commit as Work-IWF and `git config --get commit.gpgsign` is `true`, first probe whether the passphrase is already cached (no side effects — throwaway detached signature to /dev/null):

```sh
echo probe | "$(git config --get gpg.program || echo gpg)" --pinentry-mode error --local-user "$(git config --get user.signingkey)" --detach-sign -o /dev/null 2>/dev/null; echo $?
```

Exit `0` = cached → the commit will succeed, go ahead.
Non-zero = gpg would prompt → do NOT run the commit (it would fail mid-way).
Instead tell me to cache the passphrase myself by doing a throwaway sign/commit in my own terminal (outside the TUI), then I'll tell you to commit again.
(`--pinentry-mode error` needs gpg ≥2.1; assumes openpgp signing.)

# Caveman mode

Never switch to caveman mode automatically.
Only use it when I explicitly ask for it.

# Fable: coordinate, don't crunch

When you are running as Fable (Mythos-tier), it's too expensive for bulk work — my limits burn fast.
Use Fable for what it's uniquely good at: coordinating, deciding, and reviewing.
Delegate the crunch work — implementation passes, bulk writes/deletes/renames, research sweeps, file-by-file mechanical changes — to subagents on a cheaper model (e.g. `model: opus` on the Agent tool), then review their output yourself.
Doing a task directly is only OK when it's so small that spawning an agent would cost more than just doing it (a one-line edit, a quick read).

# Code style

- Don't write obvious comments for every line when the code speaks for itself — comment complex logic or non-obvious decisions instead.
- Don't write authorship/date metadata in doc comments (e.g. `@author`/`@since` in PHP, equivalent tags in other languages).
- Before writing new code, check sibling and nearby files for something similar to reuse, and match the existing code style.
- Never hardcode user-facing strings — put them in the project's localization files and emit them through its translation mechanism (e.g. Symfony translator, i18next, gettext, resource bundles).
- A config file holds only what differs from the tool's default. Look up the default before writing a line (e.g. `ansible-config list`, `helm show values`); restating it is noise and invites getting it subtly wrong. Where relying on a default deliberately is worth recording, say so in the README.
- Committed files don't point at other repositories. Explain a setting by what it does and why, not by contrast with another repo ("Y, because <reason>", not "unlike X, we do Y"). Reading other repos for conventions is fine.

# Editing files with scripts

- Whenever a file edit is made by a script or shell command (`python`, `sed`, `awk`, `perl`, a heredoc, …) rather than the editing tools, end that turn's edits with `git diff --stat` followed by `git diff` and show the output.
  The point is that the diff, not the script, is the reviewable artefact: the edit path may change freely, but the result must never be invisible to me.
- For files git doesn't track yet, `git add -N <path>` first so they appear in the diff.

# Dependencies

- Before reaching for a new library, check what's already declared in the project's package manifest (e.g. `composer.json`, `package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`) and prefer what's there.
  That said, I don't mind adding a library when it keeps the project's complexity down and the code more human-readable — e.g. in Rust I care more about readability than binary size.
- Prefer the native mechanism of the tool already in use over another program (e.g. `terraform.tfvars` rather than direnv; a tool's own credentials file rather than a sourced `~/.config/<thing>/tokens.env`).
  Mention an alternative only if the native one genuinely can't do the job, and say exactly which part it can't do.
  Never re-propose an option I've already declined.

# Working with me

- When I have to run something, spell out the complete commands every time, in order, including port-forwards — even if they were given earlier. A reference to earlier steps is only extra explanation, never a substitute.
- I'm in Europe/Zurich: every clock time in chat is Zurich local time, without UTC labels or dual times. Where a command or manifest needs a UTC value, convert it yourself and hand over the finished value. Repo docs keep their own conventions.
- Generated passwords are 20 characters of letters, digits and symbols (`op item create --generate-password='letters,digits,symbols,20'`), unless a system dictates a length (say so then).
- For infrastructure and operations work: explain the concepts plainly and wait for my explicit go-ahead before writing or running anything — I want to understand each step before it happens.

# Keeping docs in sync

- When I change something a project's `CLAUDE.md`/`AGENTS.md` (or similar agent docs) describes, update that doc in the same change so it stays accurate.

# Where knowledge goes

- Knowledge about a project — decisions and their reasons, gotchas, runbooks, how the parts fit together — goes into the project's own docs, wherever the project keeps them (README, `AGENTS.md`, `docs/`, a wiki), so it reaches every machine and every teammate.
  In a new repo, or one with no convention against it, that place is `docs/`.
- Memory stays minimal: only what can't or shouldn't live in the repo — my personal preferences, things that must not become public, open plans that are never committed, and projects that don't want such docs (some work repos).
  If unsure whether a work repo wants a new doc, ask before adding it.
- Before saving a memory, check whether it belongs in the project's docs instead; if so, suggest putting it there.

# Improving OpenCode's instructions

I sometimes hand you a plan or output produced by OpenCode (which runs off `~/.config/opencode/AGENTS.md`).
When you notice that OpenCode's result could have been better — a rule it was missing, a pattern it got wrong, guidance that would have prevented the gap — fold that improvement back into `~/.config/opencode/AGENTS.md` so OpenCode does it right next time.
Keep those additions general and in the file's existing style (it holds cross-project working agreements, not project-specific rules).
Tell me what you added and why.

Several rules are deliberately **mirrored** in both this file and `~/.config/opencode/AGENTS.md` (or its skills under `~/.config/opencode/skills/`): git safety + author profiles + GPG pre-check, containerized commands (`iwf` CLI), dependencies, comments/i18n, docs-sync, and commit-message style.
When either copy of a mirrored rule changes, update the other file in the same change so they don't drift.

# Running commands in containerized projects

Many of my projects (typically Symfony backend + React JS/TS frontend) run inside Docker containers, so don't run `php`/`composer`/`yarn`/etc. directly on the host.

For IWF projects — recognizable by a `.iwf.yml` in the project root — use the `iwf` CLI, which runs commands in the container for the current working directory:

- `iwf symfony console <command>` — run a Symfony console command
- `iwf composer <command>` — run a Composer command
- `iwf yarn <command>` — run a Yarn command
- `iwf run "<command>"` — run an arbitrary command in the container shell, e.g. `iwf run "phpstan && rm -rf var/cache/test* var/share/test* var/storage/test* && vendor/bin/paratest"`

For non-IWF containerized projects (no `.iwf.yml`), fall back to `docker compose exec` (or `docker exec`).

# Commit messages

- Always use Conventional Commits: `type: subject` (`feat`, `fix`, `chore`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `style`).
- Describe **what** changed, not why. Staying general is fine — the message doesn't need to enumerate every detail.
- Keep the subject line ≤80 characters (ticket prefix included).
- Never insert line breaks within a paragraph — each paragraph is one continuous line (soft-wrapped by the viewer, not hard-wrapped).
- Avoid lists (`-` / `*`) where possible; prefer prose.

## IWF repos (remote `git.iwf.io` or `github.com/iwf-web`)

- Always prefix the ticket nr. when one is available, before the conventional type: `VOP-249 | refactor: take number formatters from the ci hooks`.
  No ticket available → plain conventional commit (`chore: enable react compiler`).
- Never add a body/description — title only.
- A body is only acceptable in the rare case where an 80-char title genuinely can't cover the changes. Treat that as an exception, not a habit.
