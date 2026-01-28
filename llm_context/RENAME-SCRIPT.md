# Rename Script for Alphanumeric LLM Context Files
# Run this in your llm-context directory to rename files

## PowerShell Version (Windows)

```powershell
# Navigate to your context directory
cd C:\Dev\docs\llm-context

# Rename files to alphanumeric format
# Documentation
Rename-Item "README.md" "00-README.md" -ErrorAction SilentlyContinue

# Quick Start Files  
Rename-Item "dylan-quick-reference.md" "01-quick-reference.md" -ErrorAction SilentlyContinue
Rename-Item "[yourname]-quick-reference.md" "01-quick-reference.md" -ErrorAction SilentlyContinue

Rename-Item "dylan-llm-instructions.md" "02-llm-instructions.md" -ErrorAction SilentlyContinue
Rename-Item "[yourname]-llm-instructions.md" "02-llm-instructions.md" -ErrorAction SilentlyContinue

# Domain Context Files
Rename-Item "cs-engineering-competency.md" "10-cs-engineering-competency.md" -ErrorAction SilentlyContinue
Rename-Item "it-sysadmin-context.md" "11-it-sysadmin-context.md" -ErrorAction SilentlyContinue
Rename-Item "audio-studio-context.md" "12-audio-studio-context.md" -ErrorAction SilentlyContinue
Rename-Item "home-network-context.md" "13-home-network-context.md" -ErrorAction SilentlyContinue
Rename-Item "active-projects-context.md" "14-active-projects-context.md" -ErrorAction SilentlyContinue

# Supporting Files
Rename-Item "miscellaneous-context.md" "20-miscellaneous-context.md" -ErrorAction SilentlyContinue

# Verify results
Write-Host "`nRename complete! Here's your new structure:" -ForegroundColor Green
Get-ChildItem *.md | Sort-Object Name | Format-Table Name, Length, LastWriteTime
```

## Bash Version (Linux/macOS/Git Bash on Windows)

```bash
#!/bin/bash
# Navigate to your context directory
cd ~/dev/docs/llm-context
# or: cd /c/Dev/docs/llm-context  # Git Bash on Windows

# Rename files to alphanumeric format
# Documentation
[ -f "README.md" ] && mv "README.md" "00-README.md"

# Quick Start Files
[ -f "dylan-quick-reference.md" ] && mv "dylan-quick-reference.md" "01-quick-reference.md"
[ -f "[yourname]-quick-reference.md" ] && mv "[yourname]-quick-reference.md" "01-quick-reference.md"

[ -f "dylan-llm-instructions.md" ] && mv "dylan-llm-instructions.md" "02-llm-instructions.md"
[ -f "[yourname]-llm-instructions.md" ] && mv "[yourname]-llm-instructions.md" "02-llm-instructions.md"

# Domain Context Files
[ -f "cs-engineering-competency.md" ] && mv "cs-engineering-competency.md" "10-cs-engineering-competency.md"
[ -f "it-sysadmin-context.md" ] && mv "it-sysadmin-context.md" "11-it-sysadmin-context.md"
[ -f "audio-studio-context.md" ] && mv "audio-studio-context.md" "12-audio-studio-context.md"
[ -f "home-network-context.md" ] && mv "home-network-context.md" "13-home-network-context.md"
[ -f "active-projects-context.md" ] && mv "active-projects-context.md" "14-active-projects-context.md"

# Supporting Files
[ -f "miscellaneous-context.md" ] && mv "miscellaneous-context.md" "20-miscellaneous-context.md"

# Verify results
echo -e "\nRename complete! Here's your new structure:"
ls -lh *.md
```

## Git-Aware Rename (Preserves History)

If you've already committed these files to Git, use `git mv` instead to preserve history:

```bash
#!/bin/bash
cd C:/Dev/docs/llm-context  # or your path

# Documentation
git mv README.md 00-README.md

# Quick Start
git mv dylan-quick-reference.md 01-quick-reference.md
git mv dylan-llm-instructions.md 02-llm-instructions.md

# Domain Context
git mv cs-engineering-competency.md 10-cs-engineering-competency.md
git mv it-sysadmin-context.md 11-it-sysadmin-context.md
git mv audio-studio-context.md 12-audio-studio-context.md
git mv home-network-context.md 13-home-network-context.md
git mv active-projects-context.md 14-active-projects-context.md

# Supporting
git mv miscellaneous-context.md 20-miscellaneous-context.md

# Commit the renames
git commit -m "Refactor: Renamed files to alphanumeric format for consistent CLI sorting"

# Verify
git log --follow 01-quick-reference.md  # Shows full history including old filename
```

## After Renaming: Update Internal References

Some files reference other files by name. Update these references:

```powershell
# PowerShell: Update references in 01-quick-reference.md
$file = "01-quick-reference.md"
(Get-Content $file) -replace 'cs-engineering-competency.md', '10-cs-engineering-competency.md' `
    -replace 'it-sysadmin-context.md', '11-it-sysadmin-context.md' `
    -replace 'audio-studio-context.md', '12-audio-studio-context.md' `
    -replace 'home-network-context.md', '13-home-network-context.md' `
    -replace 'active-projects-context.md', '14-active-projects-context.md' `
    -replace 'miscellaneous-context.md', '20-miscellaneous-context.md' | 
    Set-Content $file
```

```bash
# Bash: Update references in 01-quick-reference.md
sed -i 's/cs-engineering-competency\.md/10-cs-engineering-competency.md/g' 01-quick-reference.md
sed -i 's/it-sysadmin-context\.md/11-it-sysadmin-context.md/g' 01-quick-reference.md
sed -i 's/audio-studio-context\.md/12-audio-studio-context.md/g' 01-quick-reference.md
sed -i 's/home-network-context\.md/13-home-network-context.md/g' 01-quick-reference.md
sed -i 's/active-projects-context\.md/14-active-projects-context.md/g' 01-quick-reference.md
sed -i 's/miscellaneous-context\.md/20-miscellaneous-context.md/g' 01-quick-reference.md
```
