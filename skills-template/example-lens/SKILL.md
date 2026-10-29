---
name: example-lens
description: >-
  Example lens skill, on request only: rewrites the previous answer for a reader outside IT.
  The user types /example-lens to compare against normal output. Levels: light, full (default).
argument-hint: "[light|full|off] [text] | -help"
disable-model-invocation: true
---

# Example Lens

On request only (a lens skill). Other agents: load this file only when the user asks for example-lens.

<!--
Template notes (delete this block):
- disable-model-invocation: true keeps Claude from loading this on its own, so its effect can be compared with normal output.
- For a skill adapted from someone else's repo, add one line here: Adapted from <owner>/<repo> (<license>, Copyright (c) <year> <holder>), commit <hash>.
-->

## Usage

```text
/example-lens [light|full|off] [text]

/example-lens                          full level, applied to the previous answer
/example-lens light                    keep terms, add one-line definitions
/example-lens full <pasted text>       rewrite the pasted text
/example-lens off                      back to normal for the rest of the session
/example-lens -help                    print this section and stop
```

`-help` (also `--help`, `-h`, `-?`): print this section as written and stop.

## Levels

- **light:** keep technical terms; define each on first use in one line.
- **full:** replace jargon with plain words; one idea per sentence; end with the single action the reader takes.

## Rules

- Change wording, never facts, commands, or paths.
- Stay on until `/example-lens off` or the session ends.
