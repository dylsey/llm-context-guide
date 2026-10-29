# `<NAME>`: Machine Inventory

**Last Updated:** 2026-10-29 21:15 UTC
**Purpose:** Machine specs, VMs, and per-machine tool notes, loaded on demand. Identity and the alias-to-hostname map live in `00-core-rules.md`; projects in `14-active-projects-context.md`.

<!--
Template notes (delete this block):
- Use your own aliases for machines here. Whether real hostnames appear anywhere in git is your call: if you keep them in `00-core-rules.md` so Claude can identify the machine, write that exception into the repo's `CLAUDE.md`.
- One bullet per machine, sub-bullets for VMs and tool quirks. Specs only: no history.
-->

---

## Machines

- **`<ALIAS_1>` (work main):** `<MAKE_MODEL>`, `<OS>` (`<ROLE, e.g. Hyper-V host>`), `<CPU>`, `<RAM>`, `<GPU if relevant>`
  - **VMs:** `<VM_1>`, `<VM_2>`
  - **Tools:** `<quirk Claude needs, e.g. a tool installed only in WSL and how to call it>`

- **`<ALIAS_2>` (home main):** `<MAKE_MODEL>`, `<OS>`, `<CPU>`, `<RAM>`
  - **VMs:** `<VM_1>`

- **`<ALIAS_3>` (laptop):** `<MAKE_MODEL>`, `<OS>`
  - **VMs:** None.

- **`<DEVICE>`:** `<DESCRIPTION>` (`<USE>`). Not joined to `llm-context`.
