---
name: removing-code
description: Use when deleting or removing UI elements, form fields, features, translation keys, or dead code
---

# Removing code

- When removing a UI element (or any node), check whether it's the **sole child** of a wrapping
  section/fieldset/heading/container. If so, remove the now-empty wrapper too.
- Removing an element usually orphans its **labels and translation keys**. Before deleting a key,
  confirm nothing else references it — keys are often **shared** with another component (e.g. a
  legacy form still in the tree). Only delete keys with no remaining consumer.
- After a removal, check what the removed thing fed into: validation arrays/lists (does the list go
  empty and need its logic removed?), reset/serialization lists, and conditional wrappers.
