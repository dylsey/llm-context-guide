# SessionEnd hook: passive reminder only, NOT automated enforcement.
# A SessionEnd hook fires after the model's last turn, so it cannot make Claude actually
# run the session-end steps (context-maintenance skill): there is no further turn to act in.
# This just surfaces a visible nudge to the user as the session closes.
#
# Versioned in llm-context (the single source of truth) so `git pull` carries wording changes to every
# machine. Only the local settings.json pointer to this file is machine-specific.

$message = "Session ending. If this session touched llm-context or another context repo, " +
           "run the session-end steps (context-maintenance skill) before it's truly done: " +
           "stale cross-reference sweep, verbosity/bloat check, Last Updated + " +
           "CHANGELOG bookkeeping, commit and push."

$output = [PSCustomObject]@{
    systemMessage = $message
}

$output | ConvertTo-Json -Compress
