# PreToolUse hook: blocks Write/Edit/MultiEdit calls whose NEW text breaks the user's
# standing writing rules (see 00-core-rules.md; edit the patterns below to match yours): em-dashes, emojis, checkbox lists,
# "Last Updated" lines that aren't full UTC datetime, and status tags not on the standard list.
#
# Only the text being added is checked (Write content, Edit new_string, MultiEdit
# new_strings), never the rest of the file, so pre-existing violations elsewhere in a
# file don't block unrelated edits. Inline code spans and fenced code blocks are
# exempt, so a rule can quote the characters it bans. Status tags are the exception:
# they're written inside inline code (`[ACTIVE]`), so that check reads the raw line and
# exempts only fenced blocks.
#
# Exit 2 with a stderr message blocks the tool call and shows the reason to Claude.
# Exit 0 lets it through. Any parse failure exits 0: a broken hook must never block work.
#
# Versioned in llm-context (the single source of truth) so `git pull` carries fixes to every machine. Only
# the local settings.json pointer to this file is machine-specific.

$ErrorActionPreference = 'Stop'

# File types the rules apply to. Code files are excluded.
$lintedExtensions = @('.md', '.markdown', '.txt')

# The allowed status tags are read from the context-maintenance skill's "Status tags"
# section, the single source of truth, so this script never holds its own copy. The
# skill is junction-linked into ~/.claude/skills on every onboarded machine.
$statusTagSource = Join-Path $HOME '.claude\skills\context-maintenance\SKILL.md'

try {
    [Console]::InputEncoding = [System.Text.Encoding]::UTF8
    # Strip a leading byte-order mark: some parent processes prepend one, and
    # ConvertFrom-Json rejects it, which would make the hook fail open.
    $hookInput = [Console]::In.ReadToEnd().TrimStart([char]0xFEFF) | ConvertFrom-Json
} catch {
    exit 0
}

$toolInput = $hookInput.tool_input
if ($null -eq $toolInput -or [string]::IsNullOrEmpty($toolInput.file_path)) { exit 0 }

$extension = [System.IO.Path]::GetExtension($toolInput.file_path).ToLowerInvariant()
if ($lintedExtensions -notcontains $extension) { exit 0 }

switch ($hookInput.tool_name) {
    'Write'     { $newText = [string]$toolInput.content }
    'Edit'      { $newText = [string]$toolInput.new_string }
    'MultiEdit' { $newText = (@($toolInput.edits) | ForEach-Object { [string]$_.new_string }) -join "`n" }
    default     { exit 0 }
}
if ([string]::IsNullOrEmpty($newText)) { exit 0 }

# CHANGELOG.md is historical record and may name retired tags. If the skill can't be
# read or its section has no tags, the status-tag check is skipped (fail open).
$allowedStatusTags = $null
if ([System.IO.Path]::GetFileName($toolInput.file_path) -ine 'CHANGELOG.md') {
    try {
        $skillText = [System.IO.File]::ReadAllText($statusTagSource)
        $section = [regex]::Match($skillText, '(?ms)^## Status tags\b(.*?)(?=^## |\z)')
        if ($section.Success) {
            $allowedStatusTags = @([regex]::Matches($section.Groups[1].Value, '`\[([A-Z][A-Z0-9_]+)\]`') |
                ForEach-Object { $_.Groups[1].Value })
            if ($allowedStatusTags.Count -eq 0) { $allowedStatusTags = $null }
        }
    } catch {
        $allowedStatusTags = $null
    }
}

# Banned characters are built from [char] code points so this script stays pure ASCII
# (Windows PowerShell 5.1 misreads BOM-less UTF-8) and never contains what it bans.
# The dingbat range U+2600 to U+27BF skips U+266D to U+266F (flat, natural, sharp):
# real music notation in chord names like F#m or Bbmaj7.
$emDashPattern   = [string][char]0x2014
$emojiPattern    = '[{0}-{1}][{2}-{3}]|[{4}-{5}{11}-{12}]|[{6}{7}{8}{9}{10}]' -f `
    [char]0xD83C, [char]0xD83E, [char]0xDC00, [char]0xDFFF, [char]0x2600, [char]0x266C, `
    [char]0x2B50, [char]0x2B55, [char]0x2705, [char]0x274C, [char]0xFE0F, `
    [char]0x2670, [char]0x27BF
$checkboxPattern = '^\s*(?:[-*+]|\d+\.)\s+\[[ xX]\]'
$lastUpdatedLine = '\*\*Last Updated:\*\*'
$lastUpdatedOk   = '\*\*Last Updated:\*\*\s+\d{4}-\d{2}-\d{2} \d{2}:\d{2} UTC\s*$'
# A bracketed all-caps word is a status tag by convention (placeholders use `<NAME>`,
# hardware buttons use **BOLD**). Not a tag: link text [X](url), reference links [x][X],
# images ![X], and indexing like name[KEY]. Case-sensitive, so [!NOTE] alerts never match.
$statusTagPattern    = '(?<![\w\]!])\[([A-Z][A-Z0-9_]+)\](?![\(\[])'
$referenceDefinition = '^\s{0,3}\[[^\]]+\]:\s'

$violations = New-Object System.Collections.Generic.List[string]
$insideFence = $false
$lineNumber = 0

foreach ($rawLine in ($newText -split "`r?`n")) {
    $lineNumber++

    if ($rawLine -match '^\s*(```|~~~)') {
        $insideFence = -not $insideFence
        continue
    }
    if ($insideFence) { continue }

    # Drop inline code spans before checking, so quoted examples are allowed.
    $line = $rawLine -replace '`[^`]*`', ''
    $preview = $rawLine.Trim()
    if ($preview.Length -gt 70) { $preview = $preview.Substring(0, 70) + '...' }

    if ($line -match $emDashPattern)   { $violations.Add("line ${lineNumber}: em-dash: $preview") }
    if ($line -match $emojiPattern)    { $violations.Add("line ${lineNumber}: emoji or symbol: $preview") }
    if ($line -match $checkboxPattern) { $violations.Add("line ${lineNumber}: checkbox list item: $preview") }
    if ($line -match $lastUpdatedLine -and $line -notmatch $lastUpdatedOk) {
        $violations.Add("line ${lineNumber}: Last Updated must be 'YYYY-MM-DD HH:MM UTC' from a command: $preview")
    }
    if ($null -ne $allowedStatusTags -and $rawLine -notmatch $referenceDefinition) {
        foreach ($tagMatch in [regex]::Matches($rawLine, $statusTagPattern)) {
            $tag = $tagMatch.Groups[1].Value
            if ($allowedStatusTags -cnotcontains $tag) {
                $violations.Add("line ${lineNumber}: [$tag] is not a status tag from the context-maintenance skill list: $preview")
            }
        }
    }
}

if ($violations.Count -eq 0) { exit 0 }

$message = "Blocked by lint-authored-text hook (writing rules) in $($toolInput.file_path):`n" +
           ($violations -join "`n") +
           "`nFix: em-dash -> period, comma, colon, or parentheses; remove emojis; use plain list items; " +
           "Last Updated from Get-Date -AsUTC -Format ""yyyy-MM-dd HH:mm 'UTC'""; " +
           "status tags only from the context-maintenance skill list, placeholders as ``<NAME>``, button names as **BOLD**. " +
           "Line numbers are within the new text."
[Console]::Error.WriteLine($message)
exit 2
