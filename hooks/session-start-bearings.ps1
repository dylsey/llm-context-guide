# SessionStart hook: automates session-start bearings (context-maintenance skill, "Sessions across machines").
# Feeds hostname/user/pwd and the git status/pull results for llm-context and the skills
# repo directly into the model's context via hookSpecificOutput.additionalContext, so
# bearings are established before the first response instead of relying on the model to
# run these commands itself.
#
# This script is versioned in llm-context (the single source of truth) so `git pull` carries fixes to every
# machine. Only the local settings.json pointer to this file is machine-specific.

$ErrorActionPreference = 'Continue'

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("Host: $env:COMPUTERNAME")
$lines.Add("User: $(whoami)")
$lines.Add("PWD: $(Get-Location)")

# This script lives inside the llm-context clone, so its own location is the confirmed path.
$llmContextPath = Split-Path -Parent $PSScriptRoot

# Anomalies accumulate here; a systemMessage is only emitted (visible to the user) if this
# is non-empty. Silent on a clean run: additionalContext below still always fires (feeds
# the model every time regardless), only the user-visible confirmation is conditional.
$anomalies = New-Object System.Collections.Generic.List[string]

# A git pull brings new skill folders down, but Claude Code only loads skills linked into
# ~/.claude/skills, and links are per machine. Link every repo folder that holds a SKILL.md
# and has nothing at its link path yet. Never replaces or removes an existing path: a link
# whose target was deleted upstream is only reported, since removal is the user's call.
function Sync-SkillLinks {
    param([string]$SkillsRepoPath, [string]$SkillsLinkDir)

    $result = [PSCustomObject]@{ Linked = @(); Dangling = @(); Failed = @() }
    foreach ($skillFolder in Get-ChildItem -LiteralPath $SkillsRepoPath -Directory) {
        if (-not (Test-Path -LiteralPath (Join-Path $skillFolder.FullName 'SKILL.md'))) { continue }
        $linkPath = Join-Path $SkillsLinkDir $skillFolder.Name
        # Get-Item, not Test-Path: Test-Path reports a broken junction as missing.
        if (Get-Item -LiteralPath $linkPath -Force -ErrorAction SilentlyContinue) { continue }
        try {
            New-Item -ItemType Junction -Path $linkPath -Target $skillFolder.FullName -ErrorAction Stop | Out-Null
            $result.Linked += $skillFolder.Name
        } catch {
            $result.Failed += "$($skillFolder.Name) ($($_.Exception.Message))"
        }
    }
    foreach ($link in Get-ChildItem -LiteralPath $SkillsLinkDir -Force -ErrorAction SilentlyContinue) {
        if ($link.LinkType -ne 'Junction') { continue }
        $target = @($link.Target)[0]
        # Trailing separator so a sibling like skills-old\ doesn't count as inside the repo.
        if ($target -and $target.StartsWith($SkillsRepoPath.TrimEnd('\') + '\', [System.StringComparison]::OrdinalIgnoreCase) -and -not (Test-Path -LiteralPath $target)) {
            $result.Dangling += $link.Name
        }
    }
    return $result
}

if (Test-Path $llmContextPath) {
    $lines.Add("llm-context path: $llmContextPath")

    $status = git -C $llmContextPath status 2>&1 | Out-String
    $lines.Add("--- git status ---")
    $lines.Add($status.Trim())

    $porcelain = git -C $llmContextPath status --porcelain 2>&1 | Out-String
    $uncommittedCount = (@($porcelain -split "`r?`n") | Where-Object { $_.Trim() -ne '' }).Count
    if ($uncommittedCount -gt 0) {
        $anomalies.Add("$uncommittedCount uncommitted file(s) in llm-context")
    }

    $pull = git -C $llmContextPath pull 2>&1 | Out-String
    $pullExitCode = $LASTEXITCODE
    $lines.Add("--- git pull ---")
    $lines.Add($pull.Trim())
    if ($pullExitCode -ne 0 -or $pull -match 'error|fatal|conflict') {
        $anomalies.Add("git pull reported a problem in llm-context: check manually")
    }
} else {
    $lines.Add("WARNING: llm-context not found at expected path $llmContextPath")
    $anomalies.Add("llm-context not found at expected path $llmContextPath")
}

# The skills repo must be as current as llm-context: lint-authored-text.ps1 reads its
# allowed status tags from the context-maintenance skill, so a stale skills clone makes
# the hook block valid tags. The repo is located through the junction the hook itself
# reads (~/.claude/skills/context-maintenance), so this pulls exactly the copy in use.
$skillJunctionPath = Join-Path $env:USERPROFILE '.claude\skills\context-maintenance'
$skillJunctionTarget = $null
if (Test-Path $skillJunctionPath) {
    # .Target is a string in Windows PowerShell 5.1 and a string array in PowerShell 7.
    $skillJunctionTarget = @((Get-Item $skillJunctionPath -Force).Target)[0]
}
if ($skillJunctionTarget -and (Test-Path (Join-Path (Split-Path -Parent $skillJunctionTarget) '.git'))) {
    $skillsPath = Split-Path -Parent $skillJunctionTarget
    $lines.Add("skills path: $skillsPath")

    $skillsPorcelain = git -C $skillsPath status --porcelain 2>&1 | Out-String
    $skillsUncommittedCount = (@($skillsPorcelain -split "`r?`n") | Where-Object { $_.Trim() -ne '' }).Count
    if ($skillsUncommittedCount -gt 0) {
        $lines.Add("--- skills git status ---")
        $lines.Add($skillsPorcelain.Trim())
        $anomalies.Add("$skillsUncommittedCount uncommitted file(s) in skills")
    }

    $skillsPull = git -C $skillsPath pull 2>&1 | Out-String
    $skillsPullExitCode = $LASTEXITCODE
    $lines.Add("--- skills git pull ---")
    $lines.Add($skillsPull.Trim())
    if ($skillsPullExitCode -ne 0 -or $skillsPull -match 'error|fatal|conflict') {
        $anomalies.Add("git pull reported a problem in skills: check manually")
    }

    $skillLinks = Sync-SkillLinks -SkillsRepoPath $skillsPath -SkillsLinkDir (Split-Path -Parent $skillJunctionPath)
    if ($skillLinks.Linked.Count -gt 0) {
        $lines.Add("Linked new skill(s): $($skillLinks.Linked -join ', ')")
        $anomalies.Add("linked new skill(s) $($skillLinks.Linked -join ', '): restart the session if Claude doesn't list them yet")
    }
    if ($skillLinks.Failed.Count -gt 0) {
        $anomalies.Add("could not link skill(s): $($skillLinks.Failed -join '; ')")
    }
    if ($skillLinks.Dangling.Count -gt 0) {
        $anomalies.Add("skill link(s) point at deleted folders: $($skillLinks.Dangling -join ', '). Ask Claude to explain and remove them")
    }
} else {
    $lines.Add("WARNING: skills repo not found through the ~/.claude/skills/context-maintenance junction")
    $anomalies.Add("skills repo not found through the ~/.claude/skills/context-maintenance junction: the lint hook's status-tag check is off until it is linked")
}

# Detect (never auto-fix) whether ~/.claude/CLAUDE.md is still the old manually-copied
# full-content snapshot instead of the 2-line "@import" pattern. The old format silently
# drifts every time global-CLAUDE.template.md changes and nobody re-copies it by hand:
# this check exists so that drift gets noticed instead of sitting stale for weeks. Never
# auto-rewrites the file: it may hold machine-specific hand-edits worth a human decision.
$globalClaudeMdPath = Join-Path $env:USERPROFILE '.claude\CLAUDE.md'
if (Test-Path $globalClaudeMdPath) {
    $globalLines = Get-Content $globalClaudeMdPath
    $hasImportLine = ($globalLines -join "`n") -match '(?m)^@\S'
    if (-not $hasImportLine) {
        $anomalies.Add("~/.claude/CLAUDE.md ($($globalLines.Count) lines) has no '@import' line: still on the old manually-copied format, which silently drifts. See onboard-machine-playbook.md Step 4 to convert it")
    }
} else {
    $anomalies.Add("~/.claude/CLAUDE.md not found: this machine isn't onboarded yet, see onboard-machine-playbook.md")
}

$context = $lines -join "`n"

$output = [PSCustomObject]@{
    hookSpecificOutput = [PSCustomObject]@{
        hookEventName     = 'SessionStart'
        additionalContext = $context
    }
}

if ($anomalies.Count -gt 0) {
    $output | Add-Member -MemberType NoteProperty -Name systemMessage -Value ("SessionStart hook: " + ($anomalies -join '; ') + ".")
}

$output | ConvertTo-Json -Compress -Depth 5
