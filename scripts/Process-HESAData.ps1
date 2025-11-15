<#
.SYNOPSIS
    Stream multiple CSV files into a single CSV output without loading everything into memory.

.DESCRIPTION
    This script reads one or more CSV files in streaming mode using TextFieldParser and writes
    their rows to a single output CSV. The header from the first file is written once; subsequent
    files' headers are skipped (a warning is emitted if headers differ).

.PARAMETER InputFiles
    One or more file paths, wildcards, or directories containing CSV files.

.PARAMETER OutputFile
    Path to the resulting CSV file.

.PARAMETER Delimiter
    Field delimiter (default: ",").

.PARAMETER Encoding
    Output file encoding (default: UTF8).

.PARAMETER Force
    Overwrite output file if it exists.

.EXAMPLE
    .\Process-HESAData.ps1 -InputFiles "C:\data\*.csv" -OutputFile "C:\out\combined.csv"
#>

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string[]]$InputFiles,

    [Parameter(Mandatory = $true, Position = 1)]
    [string]$OutputFile

)

function Write-CsvFile {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [string]$Filter,
        [string]$ZeroNumberFilter
    )
 

    $in = Get-Item $InputPath
    $out = Get-Item $OutputPath
    Write-Output $in
    $reader = [System.IO.StreamReader]::new($in.FullName)
    # Using UTF8 without BOM
    $encoding = New-Object System.Text.UTF8Encoding($false)
    $writer = [System.IO.StreamWriter]::new($out.FullName, $True, $encoding)
    $counter = 0

    try {
        while ($null -ne ($line = $reader.ReadLine())) {
            if ($line -match $Filter -and $line -notmatch $ZeroNumberFilter) {
                $writer.WriteLine($line)  
                $counter++
            }
        }
    }
    finally {
        $reader.Close()
        $reader.Dispose()
        $writer.Close()
        $writer.Dispose()
    }

    Write-Output "Added $($counter) records(s) into '$OutputPath'."

}

# CAH level subject expression for computing subjects
$computingFilterExpression = '^\d+,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,11-\d{2}-\d{2}\s[^,]*,[^,]*,\d+$'
# CAH high level subject filter expression
$highLevelFilterExpression = '^\d+,[^,]*,[^,]*,[^,]*,[^,]*,All,[^,]*,\d{2}\s[^,]*,[^,]*,\d+$'


# Filter to exclude rows where the number field is zero otherwise result is too big for Excel
$zeroNumberFilter = '^.+,0$';


$dir = [System.IO.Path]::GetDirectoryName($OutputFile)
if ($dir -and -not (Test-Path $dir)) { 
    [System.IO.Directory]::CreateDirectory($dir) | Out-Null 
}

if (Test-Path $OutputFile) {
    Remove-Item $OutputFile -Force
}

New-Item -Path $OutputFile -ItemType File -Force | Out-Null 
Set-Content -Path $OutputFile -Value "UKPRN,HE provider,Level of study,Mode of study,Country of HE provider,Region of HE provider,CAH level marker,CAH level subject,Academic Year,Number" -Encoding utf8NoBOM

# Resolve input files (support wildcards and directories)
foreach ($in in $InputFiles) {
    if (Test-Path $in) {
        Write-CsvFile -InputPath $in -OutputPath $OutputFile -Filter $highLevelFilterExpression -ZeroNumberFilter $zeroNumberFilter
    }
} 

Write-Output "Merged $($InputFiles.Count) file(s) into '$OutputFile'."





