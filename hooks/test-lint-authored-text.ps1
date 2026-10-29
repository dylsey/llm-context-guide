# Regression tests for lint-authored-text.ps1. Run after any change to the hook, and once
# on each machine after registering it:
#
#   & "<llm-context>\hooks\test-lint-authored-text.ps1"
#
# Each case pipes a PreToolUse JSON payload into the hook and checks the exit code: 0
# allowed, 2 blocked. Every case runs twice: under Windows PowerShell 5.1 (-File), and under
# PowerShell 7 in the exact form settings.json registers ("shell": "powershell" runs pwsh
# -Command). Under -Command, the hook's exit 2 collapses to 1 (non-blocking) unless the
# registered command ends with "; exit $LASTEXITCODE", so the second runner guards that.
# Banned characters are built from code points so this file stays pure ASCII, like the hook.

param([string]$HookPath = (Join-Path $PSScriptRoot 'lint-authored-text.ps1'))

function Get-Char([int]$codePoint) { [char]::ConvertFromUtf32($codePoint) }

$emDash = Get-Char 0x2014
$fence = '```'

$cases = @(
    @{ Name = 'clean write';            Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "# Title`nPlain text." } } }
    @{ Name = 'em-dash';                Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "one $emDash two" } } }
    @{ Name = 'emoji';                  Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "done $(Get-Char 0x1F600)" } } }
    @{ Name = 'checkbox';               Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "- [ ] task" } } }
    @{ Name = 'inline-code exemption';  Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "ban ``$emDash`` here" } } }
    @{ Name = 'fenced-block exemption'; Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "$fence`nout $emDash put`n$fence" } } }
    @{ Name = 'Last Updated date only'; Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "**Last Updated:** 2026-10-23" } } }
    @{ Name = 'Last Updated full UTC';  Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "**Last Updated:** 2026-10-23 14:05 UTC" } } }
    @{ Name = '.ps1 ignored';           Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.ps1'; content = "# one $emDash two" } } }
    @{ Name = 'Edit';                   Expected = 2; Json = @{ tool_name = 'Edit'; tool_input = @{ file_path = 'a.md'; old_string = 'x'; new_string = "y $emDash z" } } }
    @{ Name = 'MultiEdit';              Expected = 2; Json = @{ tool_name = 'MultiEdit'; tool_input = @{ file_path = 'a.md'; edits = @(@{ old_string = 'a'; new_string = 'fine' }, @{ old_string = 'b'; new_string = "bad $emDash" }) } } }
    @{ Name = 'check mark U+2713';      Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "done $(Get-Char 0x2713)" } } }
    @{ Name = 'non-write tool';         Expected = 0; Json = @{ tool_name = 'Read'; tool_input = @{ file_path = 'a.md' } } }
    @{ Name = 'garbage input';          Expected = 0; Raw = 'not json {' }
    @{ Name = 'sharp F#m allowed';      Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "Chord: F$(Get-Char 0x266F)m" } } }
    @{ Name = 'flat and natural ok';    Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "B$(Get-Char 0x266D)maj7 then B$(Get-Char 0x266E)" } } }
    @{ Name = 'eighth note U+266A';     Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "tune $(Get-Char 0x266A)" } } }
    @{ Name = 'boundary U+266C';        Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "x $(Get-Char 0x266C)" } } }
    @{ Name = 'boundary U+2670';        Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "x $(Get-Char 0x2670)" } } }
    @{ Name = 'boundary U+2600';        Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "x $(Get-Char 0x2600)" } } }
    @{ Name = 'boundary U+27BF';        Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "x $(Get-Char 0x27BF)" } } }
    # Status-tag cases read the live list from ~/.claude/skills/context-maintenance/SKILL.md. If
    # that file is missing, the check fails open and the "blocked" cases below fail, flagging it.
    @{ Name = 'listed tag in code';     Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "**Status:** ``[PAUSED]``" } } }
    @{ Name = 'retired tag in code';    Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "**Status:** ``[ON_HOLD]``" } } }
    @{ Name = 'unlisted bare tag';      Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "- RK006 hub [UNUSED]" } } }
    @{ Name = 'caps placeholder';       Expected = 2; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "Name: [YOUR_NAME]" } } }
    @{ Name = 'angle placeholder';      Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "Name: ``<YOUR_NAME>``" } } }
    @{ Name = 'tag in fenced block';    Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "$fence`n[BROKEN] -> [PAUSED]`n$fence" } } }
    @{ Name = 'link text not a tag';    Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "See [LICENSE](LICENSE)." } } }
    @{ Name = 'reference definition';   Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "[CODEOWNERS]: ./CODEOWNERS" } } }
    @{ Name = 'alert not a tag';        Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'a.md'; content = "> [!NOTE]`n> text" } } }
    @{ Name = 'CHANGELOG exempt';       Expected = 0; Json = @{ tool_name = 'Write'; tool_input = @{ file_path = 'C:\x\CHANGELOG.md'; content = "- ``[ON_HOLD]`` replaced with ``[PAUSED]``" } } }
)

$runners = @(
    @{ Name = '5.1 -File'; FileName = 'powershell.exe'; Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$HookPath`"" }
    @{ Name = '7 registered'; FileName = 'pwsh'; Arguments = "-NoProfile -Command `"& '$HookPath'; exit `$LASTEXITCODE`"" }
)

$failureCount = 0
$runCount = 0
foreach ($runner in $runners) {
  foreach ($case in $cases) {
    $runCount++
    $inputText = if ($case.Raw) { $case.Raw } else { $case.Json | ConvertTo-Json -Depth 6 -Compress }

    # Write stdin as raw BOM-less UTF-8 bytes, which is what Claude Code sends the hook.
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = $runner.FileName
    $startInfo.Arguments = $runner.Arguments
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardInput = $true
    $startInfo.RedirectStandardError = $true
    $startInfo.RedirectStandardOutput = $true
    $process = [System.Diagnostics.Process]::Start($startInfo)
    $inputBytes = (New-Object System.Text.UTF8Encoding $false).GetBytes($inputText)
    $process.StandardInput.BaseStream.Write($inputBytes, 0, $inputBytes.Length)
    $process.StandardInput.Close()
    $null = $process.StandardError.ReadToEnd()
    $process.WaitForExit()

    $result = if ($process.ExitCode -eq $case.Expected) { 'PASS' } else { $failureCount++; 'FAIL' }
    '{0}  {1,-13} {2,-24} expected {3} got {4}' -f $result, $runner.Name, $case.Name, $case.Expected, $process.ExitCode
  }
}
"$runCount runs ($($cases.Count) cases x $($runners.Count) shells), $failureCount failed"
if ($failureCount -gt 0) { exit 1 }
