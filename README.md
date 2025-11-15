# 49490006-2526-student

A repository for PowerShell scripts

## Description

This repository contains PowerShell scripts and modules for various automation tasks.

## Structure

```
.
├── scripts/        # PowerShell scripts
├── modules/        # PowerShell modules
├── docs/          # Documentation
└── README.md      # This file
```

## Usage

### Running Scripts

Scripts are located in the `scripts/` directory. To run a script:

```powershell
.\scripts\ScriptName.ps1
```

## DataSets

**Process-HESAData.ps1** filters HESA (2025) ‘Table 49 - HE student enrolments by HE provider and subject of study 2014/15 to 2023/24’. Available at: https://www.hesa.ac.uk/data-and-analysis/students/table-49.zip (Accessed: 15 November 2025).


### Launch Configuration

For debugging in VS Code, create a launch configuration. Although args is an array, it usually works best to put all the arguments in a single string

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "PowerShell: Debug Process-Script.ps1",
            "type": "PowerShell",
            "request": "launch",
            "script": "${workspaceFolder}\\scripts\\Script.ps1",
            "args": [],
            "cwd": "${workspaceFolder}",
        }
    ]
}
```


