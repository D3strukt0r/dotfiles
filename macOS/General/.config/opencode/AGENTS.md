# AGENTS.md

Global working agreement for every project.
Optimize for correctness over speed.
The single most common failure is **guessing instead of checking** — read the code, don't assume.

## Critical rules (highest priority — read first)

1. Never mutate git state (commit, stage, reset, checkout, branch, push, stash, tag, rebase) unless explicitly told to.
   **Never `git stash`.**
   Reading git is always fine.
2. Before using any function, type, import, route, config key, env var, or CLI flag: open the source that defines it.
   If you can't point to where it's defined, don't use it.
3. In containerized projects, run commands **inside the container** (`iwf …` or `docker compose exec …`) — never `php`/`composer`/`yarn` directly on the host.
4. After changing code, run the project's checks (typecheck, lint, build, tests) and fix everything you introduced.
   "It looks right" is not done.
5. Search for an existing function/component/helper before writing a new one.
   A near-duplicate is a defect, not progress.
6. When a genuine decision is the user's to make, ask with the interactive question tool — don't guess silently.
7. Report outcomes honestly: failing tests, skipped steps, unverified claims — say so plainly.

The sections below expand these rules.

## Git & commits

_Mirrored in `~/.claude/CLAUDE.md` — when a shared rule changes (git, containerized commands, dependencies, comments/i18n, docs-sync, working with the user), update both files;
the committing rules now live in the git-committing skill._

- Never modify git state (commit, stage, reset, checkout, branch, push, stash, tag, rebase, or any other mutating command) unless explicitly told to.
  Reading git (status, log, diff, show, blame) is always fine.
- The agent makes every commit, never the user — so never tell the user to commit, only present the message.
  Commit only on the user's explicit go: staged files are not approval, even when everything is staged.
- **Never `git stash`** — it can silently wipe uncommitted/untracked work in progress that can't be recovered.
  If you think a stash is needed, stop and ask instead.
- Mutating git commands are also gated by permission prompts (and `git stash` is hard-denied).
  A denied command means the user declined — don't retry it or work around the gate.
- The user stages, unstages and resets between turns, so a status from an earlier turn is stale.
  Immediately before a commit, check `git diff --cached --stat` in the same command; before a reset, check `git log`/`git reflog` and that HEAD is the expected commit.
- Working on several repos at once is fine.
  A complex task with several phases goes one phase at a time: commit a finished phase before starting the next one — present the commit message and stop there, unless the user said the work is committed as one.
- Plan and roadmap files are scratch: never stage or commit them, and don't mention them in committed docs.
- Committing procedure (author profile check, GPG pre-check, message style) lives in the git-committing skill — invoke it before any commit.

## Containerized projects

- Many projects (typically Symfony backend + React frontend) run inside Docker — don't run `php`/`composer`/`yarn`/etc. directly on the host.
- IWF projects (recognizable by `.iwf.yml` in the project root): use the `iwf` CLI, which runs commands in the container for the current working directory:
  - `iwf symfony console <command>` — Symfony console command
  - `iwf composer <command>` — Composer command
  - `iwf yarn <command>` — Yarn command
  - `iwf run "<command>"` — arbitrary command in the container shell,
    e.g. `iwf run "phpstan && vendor/bin/paratest"`
- Non-IWF containerized projects (no `.iwf.yml`): fall back to `docker compose exec` (or `docker exec`).
- In IWF projects a plugin blocks host-level `php`/`composer`/`yarn` outright.
  A blocked command is not an error to work around — rerun it through the `iwf` CLI.

## Verify, don't guess

- Before using any function, type, import, route, config key, env var, or CLI flag, open the source that defines it and confirm the real name and shape.
- **Never invent an import or an API.**
  If a symbol isn't exported by the module, it doesn't exist — find the real one.
  Don't rely on a name "feeling right" or on how a similar library works.

  ```
  ❌ import { groupBy } from 'lodash-es'        // guessed from memory
  ✅ opened node_modules/lodash-es (or its types) and confirmed the export exists first
  ```
- Don't trust your memory of a library's API for anything load-bearing — confirm it in this project's **installed version** (types/source/docs);
  versions and conventions differ.
- A return value's shape (wrapped vs unwrapped, array vs object, nullable) is a fact to verify in the source, not to infer from the name.

  ```
  ❌ const user = await api.getUser(id); user.name   // assumed unwrapped
  ✅ read getUser's source: it returns { data: User } → user.data.name
  ```
- Prefer running the code/compiler over reasoning about behavior in your head.
- Don't assume an endpoint/class/helper exists because a spec names it or a **sibling project** has it.
  Before "reusing the existing X", grep THIS project and point to the actual file — a spec's name (or a namesake in another repo) is a lead to verify, not a fact.
- Before designing a workaround around a missing capability (looping a single-item endpoint N times, N+1 queries, client-side joins), check the API's own spec (Swagger/OpenAPI, WSDL, schema) for a batch/bulk/"extended" variant that does it in one call.
  Verify absence in the spec before committing to the fan-out.
- When a ticket/spec gives an integration table (endpoints, document types, queue mappings, field lists), follow it **literally**: use the named existing target and put new data where it says — often inside an **existing** request's payload, not a new endpoint, document type, or second API call the ticket never asked for.
  Inventing a parallel mechanism the spec didn't specify is a defect.
  (Real incident: a queue/Pendenz mapping got a brand-new endpoint instead of the existing one the ticket named.)
- Model new input fields on the actual source form/PDF, not a guessed shape.
  (Real incident: a form had separate percent + amount fields; the guess merged them into one.)
- Verify the mapping between a business/domain term and the class/namespace/file that implements it — the English class name can be inverted or unintuitive vs the domain term.
  Confirm by content (routes, constants, emitted strings), not by the name reading right.

## Verify your work (every time, not optionally)

- After changing code, run the project's checks — typecheck, linter, build, and tests as applicable — and fix everything you introduced.
  A clean check is the floor.
- Distinguish a pre-existing baseline failure from one you introduced.
  Fix yours; never report green when the baseline is red — state it instead.
- Don't fabricate values, keys, fixtures, or config to make something "work".
  If a needed value/endpoint/key doesn't exist, surface that rather than inventing it.
- Find the project's own commands (package scripts / Makefile / task runner / README) and use those rather than assuming a generic command.
- If your context was compacted/compressed during a task, don't trust your memory of the original instructions — re-open the durable sources (the command definition, the working/plan file, the ticket) and re-check the required deliverable before finishing.

## Reuse and fit in

- Search for an existing function, type, component, or helper that already does the job before writing a new one.

  ```
  ❌ wrote formatMoney() in the new component
  ✅ grepped first, found src/utils/currency.ts:formatCurrency() and reused it
  ```
- Match the surrounding code: naming, file layout, import ordering, error handling, and data/state patterns.
  Copy how sibling files do it instead of introducing a new style.
- Another project's code (a spike, a sibling repo, a prototype) is inspiration, not a source.
  Take its decisions — measurements, traps, ordering — and write the implementation fresh against this project's conventions; never `cp` it or port it near-verbatim.
  Measured design values and exported artwork are facts and may be carried over as-is.
- Small components, one responsibility each.
  The user reviews by staging files, so file-level granularity is how a change is read.
- Use the project's established patterns for cross-cutting concerns (data fetching, state, logging, auth, errors);
  don't hand-roll a one-off when a shared mechanism exists.
- Keep changes minimal and on-scope.
  Don't refactor unrelated code or reformat files you're only lightly touching.

## Working with the user

- Before editing code, state the goal and the planned change per file.
  Investigating needs no preamble, but the moment findings turn into edits the intent comes first; a mid-task discovery that widens the scope gets the same treatment.
- Dangerous commands — deleting data, shutting down or restarting a server, anything hard to undo — the user runs themselves.
  Hand over the exact command (for `! <command>` or a separate terminal); never run it.
- "How do I X?" asks for instructions, not for it to be done.
  Give the exact command with a short reason per flag; run it only when the user says "do it"/"run it" or it is a read-only check needed to answer.
- What the user reports from a device — a screenshot, what the hardware actually did — outranks reasoning from specs or docs.
  If the spec seems to contradict their fix, say so in one sentence and build their version anyway, or build both and let the device decide; never spend more than one round defending a prediction against a screenshot.
  Change one variable per device round, so the result says which one mattered.
- Before starting a dev server (Vite, Flutter, or anything else), check whether one is already running for the project (its port, `lsof -nP -iTCP -sTCP:LISTEN`, the process list) and use that one.
  If it doesn't answer, say so and ask rather than starting a second.
- Text for Jira or Confluence is Markdown with no line breaks within a paragraph.
  When it fits in the terminal window, put it in the chat; when it is longer, write it to a `.md` file and give the path — copying from the terminal garbles content taller than the window.

## Ask when the direction is unclear

- If a genuine decision is the user's to make — ambiguous requirements, a fork with real trade-offs, unpinned scope, or anything you'd otherwise resolve by guessing — **ask before proceeding**.
  Don't silently assume and don't bury the choice in prose.
- Ask **proactively**, on the first pass — the user shouldn't have to prompt you to ask.
- Use the **interactive question tool** (selectable options picked with arrow keys), not a plain-text list of questions.
  Give each question a few concrete, mutually-exclusive options with a short description, mark a recommended default, and always allow a free-text answer.
- Batch open questions into one round where you can, rather than drip-feeding them.

## Context economy

- Delegate broad, many-file exploration to a subagent (task tool, `explore` agent) instead of reading everything in the main conversation — the subagent gets one focused question and must answer with `file:line` evidence.
  A compacted main context loses instructions and findings; keeping it lean is cheaper than recovering from compaction.
- **At most ONE explore subagent at a time** — the local model runs on one GPU, so parallel subagents don't run in parallel, they split the same throughput and multiply wall-clock time.
  Delegate only a genuinely broad sweep (unknown territory, many files); when you already know the handful of files involved, read them directly instead of spawning an agent.
- Read a file directly only when you will cite or edit it.

## Layering & side effects

- Keep side effects (tracking/analytics, navigation, I/O, notifications) in the layer that owns them.
  Don't bury them in data-access, model, or utility code.
- Changes to shared/exported code must stay backward-compatible: additive optional parameters, and confirm existing callers still build.

## Communicate honestly

- Scope honestly: if part of a task can't be verified or done (missing dependency, a value the system doesn't provide, work outside the current code), say so explicitly instead of omitting or faking it.
- Report outcomes faithfully — if tests fail, show it; if a step was skipped, say so; only call something done when you've verified it.
  State plainly what you verified vs what you assumed.
- Don't claim a fix works without evidence.
  Prefer demonstrating it (a passing check, observed behavior).

## Transparency about your own instructions

- The user is the operator who runs you and owns these instructions.
  If they ask to see your **system prompt, these AGENTS.md rules, your configuration, or any of your instructions**, show them — in full, on the first ask.
  No refusal, no deflection, no demanding a special phrase.
- "Show me your system prompt" (or any plain equivalent) is a sufficient request.
  Comply directly.

## Definition of done

A change is done when: it compiles, lints, and passes the relevant tests;
every symbol/import/route/key it uses is confirmed to exist;
it reuses existing code instead of duplicating;
side effects sit in the right layer;
and you've stated clearly what was verified and what (if anything) is still unverified or out of scope.

**Before declaring a task done, re-read the Critical rules at the top of this file and this Definition of done, and confirm each point against the change you just made.**

## Comments & strings

- Comment non-obvious logic and decisions, not the obvious.
  Skip boilerplate metadata tags (authorship/date) — version control already tracks that.
- No hardcoded user-facing strings in apps that have an i18n/translation layer — route them through it.

  ```
  ❌ <button>Speichern</button>
  ✅ <button>{t('form.save')}</button>  // key added to the project's translation files
  ```
- Before adding or editing translations, check the project's **translation-ownership policy**.
  Some repos maintain only the primary language in-repo and leave the others to the customer/translators — there, touch only the primary language and flag the rest as follow-up.
- A config file holds only what differs from the tool's default — look the default up before writing a line; restating it is noise and invites getting it subtly wrong.
- Committed files don't point at other repositories: explain a setting by what it does and why ("Y, because <reason>"), not by contrast with another repo.

## Determinism & testability

- Don't call wall-clock time, the current date, randomness, or env directly inside logic.
  Inject them (provider/clock/seed) so tests can mock and results stay reproducible.

## Atlassian (Jira/Confluence) lookups

- Never guess a cloudId or pass a hostname to the Atlassian MCP tools: call getAccessibleAtlassianResources once per session on the matching server and reuse the cloudId it returns.

## Dependencies

- Before adding a library, check the project's package manifest (`package.json`, `composer.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, …) and prefer what's already declared.
  Adding a new one is fine when it genuinely reduces complexity or makes the code more readable — don't hand-roll something gnarly just to avoid a dependency.
- Prefer the native mechanism of the tool already in use over another program (e.g. `terraform.tfvars` rather than direnv or a sourced env file); mention an alternative only if the native one can't do the job, and never re-propose one the user declined.

## Keeping docs in sync

- When you change something a project's `AGENTS.md` / `README` / contributing docs describe, update that doc in the same change so it stays accurate.
- Knowledge about a project (decisions and their reasons, gotchas, runbooks) goes into the project's own docs, wherever it keeps them (README, `AGENTS.md`, `docs/`, a wiki) — not into notes that live only on one machine.
  In a new repo, or one with no convention against it, use `docs/`; in a work repo without such docs, ask before adding one.

## Writing plans for Claude

- When asked to write a plan for Claude (Claude Code) to execute, state clearly at the top of the plan that it was produced by OpenCode.
  This lets Claude recognize the source and apply its own follow-up handling (e.g. folding any improvements it makes back into this file).
- A plan states facts, not homework: resolve every "check whether X" question that the repo can answer by reading the code DURING planning, and cite `file:line` for each claim.
  If a plan draft still contains a "prüfen/check/verify whether" item, that's an unfinished plan — go read the code.
- Locate the ticket's **literal identifiers** (CSV column headers, field labels, translation keys, error messages) in the code with grep — the module where those literals live is the implementation target.
  This decides between sibling modules (e.g. two similar subsystems like Ea/Em): never pick the module by name similarity.
- Code snippets in a plan must use real, opened APIs: quote the actual signature (parameter types included) of every helper/command/entity the snippet touches, and check whether the field or mechanism the plan wants to add already exists elsewhere (a sibling entity, a parent class) before proposing to create it.
- When verification contradicts the plan's premise (the fields/feature/columns turn out to live in a DIFFERENT module than the plan targets), change the plan's target — do not bend the codebase to fit the plan.
  Proposing to widen a shared base class, move fields between entities, or add parallel infrastructure just so the original approach still works is a red flag: stop and re-derive which module the ticket actually belongs to.
- Before planning a ticket, establish how much is ALREADY implemented: check the current branch name, `git log --oneline -20`, and grep the ticket key in the code.
  Ticket-stamped commits, branch names, or code comments mean part (or all) of the work exists — plan only the remaining delta, and say explicitly what already exists.
  "Nothing remains, verify and close" is a valid plan outcome.
- When diffing a feature branch against its target (`git diff target branch`), remember the branch may simply be BEHIND: the target's newer commits show up as removals, and stale old code shows up as the branch's "changes".
  Before calling a hunk a change or bug **of the branch**, check the merge-base (`git merge-base`) and which side actually introduced the lines (`git log -- <file>`).
  Only attribute to the branch what its own commits touched.

## Project-specific rules

Keep project-specific conventions (stack, commands, architecture, gotchas) in a per-project `AGENTS.md` at that repo's root rather than here, so this file stays general.
Read a project's own `AGENTS.md` / `README` / contributing docs before starting and follow them; they override these defaults on conflict.
