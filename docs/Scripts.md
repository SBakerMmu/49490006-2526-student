# PowerShell Scripts Documentation

## Available Scripts

### Get-SystemInfo.ps1

**Location:** `scripts/Get-SystemInfo.ps1`

**Purpose:** Displays basic system information including computer name, PowerShell version, operating system, and current date/time.

**Usage:**
```powershell
.\scripts\Get-SystemInfo.ps1
```

**Parameters:** None

**Example Output:**
```
System Information
==================

Computer Name: DESKTOP-ABC123
PowerShell Version: 7.3.0
Operating System: Microsoft Windows 10.0.19045
Current Date/Time: 2025-11-14 16:14:38

Script completed successfully!
```

## Adding New Scripts

When adding new scripts to this repository:

1. Place the script file in the `scripts/` directory
2. Use the `.ps1` extension
3. Include proper documentation using comment-based help:
   - `.SYNOPSIS` - Brief description
   - `.DESCRIPTION` - Detailed description
   - `.PARAMETER` - Parameter descriptions
   - `.EXAMPLE` - Usage examples
   - `.NOTES` - Author and date information

4. Update this documentation file with information about the new script

## Script Naming Convention

Use PascalCase with a Verb-Noun format following PowerShell conventions:
- `Get-SystemInfo.ps1`
- `Set-Configuration.ps1`
- `Start-Process.ps1`
