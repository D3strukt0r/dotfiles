---
name: porting-migrating
description: Use when porting or migrating code between implementations, or when a legacy and a rewritten version coexist in the tree
---

# Migrations, ports, and "old vs new"

- When porting or migrating, old and new code usually follow **different** conventions. Read the
  NEW target's conventions and follow those; don't transplant an old pattern without confirming
  it's still valid.
- Diff behavior part-by-part against the source. It's easy to silently drop a sub-feature, edge
  case, or field — enumerate what the original did and account for each.
- When an old and a new implementation **coexist** (e.g. a legacy frontend and a rewrite both in
  the tree), confirm which one is actually **served/live** before planning changes — trace
  routing/entry points. Editing the dead copy fixes nothing.
