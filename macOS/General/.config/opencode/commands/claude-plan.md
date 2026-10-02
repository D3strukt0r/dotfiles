---
description: Fetch a Jira ticket (or take a description) and write an implementation plan for Claude Code
agent: plan
---
Produce an implementation plan for Claude Code to execute. Input (a Jira ticket key like ABC-123, a Jira URL, or a free-text task description):

$ARGUMENTS

Steps:

1. **Requirements.** If the input has a ticket key/URL, fetch it with the Atlassian MCP tools (getJiraIssue; get the cloudId as the global AGENTS.md "Atlassian lookups" section says — never guess one). Pick the server by URL host; bare key → try `atlassian-iwf` first, then `atlassian-publica`. Read summary, description, acceptance criteria, and comments. Free-text input → use directly. Empty → ask what to plan.

2. **Skeleton first, before any analysis.** Write `.opencode/plans/<name>.md` — `<name>` = the ticket key (e.g. `ABC-123`) or a short kebab-case slug; flat in that directory, `.md` extension (other paths are blocked in plan mode; the write tool creates the directory). Its first line, copied byte-for-byte, nothing above it:

   ```
   This plan was produced by OpenCode for Claude Code to execute.
   ```

   followed by empty headings `## Context`, `## Changes`, `## Out of scope`, `## Verification`. Build the plan by editing this file — the file is the deliverable, not a chat message. If your context gets compacted, re-read this file.

3. **References.** Fetch what the ticket points at, one level deep: linked issues (getJiraIssueRemoteIssueLinks), Confluence pages (getConfluencePage), other URLs (fetch). Skip clearly irrelevant links; flag contradictions with the main ticket in the plan. Essential attachments you cannot fetch → list under **Unreviewed attachments**.

4. **Explore.** First establish what is already implemented (current branch name, `git log --oneline -20`, grep the ticket key) and plan only the remaining delta — "nothing remains, verify and close" is a valid outcome. Then explore following the global AGENTS.md planning rules (literal-identifier grep, subagents for broad searches, `file:line` facts, no homework).

5. **Ask, don't guess** — question tool on genuine forks, before finalizing.

6. **Finalize** all four sections. Context must state the verified failure mechanism with `file:line`, or explicitly say it is unreproduced and make reproducing it the plan's first step.

7. **Report.** End with the plan file's absolute path on its own line plus a 2–3 sentence summary. Before sending, check: file exists at the step-2 path, first line matches exactly, all four sections filled, and the step-4 already-implemented check (branch names, git log, ticket-key grep) was actually performed — its result must be stated in Context. If it wasn't, do it now and revise the plan before reporting.
