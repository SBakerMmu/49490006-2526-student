<#
.SYNOPSIS
    A sample PowerShell script demonstrating basic functionality.

.DESCRIPTION
    This script serves as an example of a well-documented PowerShell script
    in this repository. It displays system information.

.EXAMPLE
    .\Get-SystemInfo.ps1
    Displays basic system information.

.NOTES
    Author: Student
    Date: 2025-11-14
#>

# Script parameters
[CmdletBinding()]
param()

# Main script logic
Write-Host "System Information" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green
Write-Host ""

# Get computer name
Write-Host "Computer Name: $env:COMPUTERNAME"

# Get PowerShell version
Write-Host "PowerShell Version: $($PSVersionTable.PSVersion)"

# Get OS information
if ($PSVersionTable.PSVersion.Major -ge 6) {
    Write-Host "Operating System: $($PSVersionTable.OS)"
} else {
    Write-Host "Operating System: Windows (PowerShell Desktop Edition)"
}

# Get current date and time
Write-Host "Current Date/Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

Write-Host ""
Write-Host "Script completed successfully!" -ForegroundColor Green
