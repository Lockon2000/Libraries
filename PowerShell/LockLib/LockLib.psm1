function ToArray {
    param($Arraylike)

    [system.collections.arraylist]$a = @()
    foreach ($b in $Arraylike){
        [void]$a.add($b)
    }
    return $a
}


function Elevate-PSSession {
    param([switch]$Preserve)

    $CurrentlyAdmin = (New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    
    if (-Not $CurrentlyAdmin)
    {
        Start-Process powershell.exe -Verb runAs -ArgumentList "-NoExit -Command cd '$PWD'"
        if (-not $Preserve) {
            Exit
        }
    } else {
        Write-Output "You have already Admin Privileges"
    }
}


function Write-Color {
    param([String[]]$Text, [ConsoleColor[]]$Color)

    for ($i = 0; $i -lt $Text.Length; $i++) {
        Write-Host $Text[$i] -Foreground $Color[$i] -NoNewLine
    }
}

function Read-Box {
    param([String]$Massege, [String]$Title, [String]$DefaultInput)

    Add-Type -AssemblyName Microsoft.VisualBasic

    [Microsoft.VisualBasic.Interaction]::InputBox($Massege, $Title, $DefaultInput)
}

function Get-Size {
    param([String]$Path=".", [Switch]$Recurse, [Switch]$b, [Switch]$k, [Switch]$M, [Switch]$G, [Switch]$h)

    if ($Recurse) {
        $Files = Get-ChildItem -Path $Path -File -Recurse
    } else {
        $Files = Get-ChildItem -Path $Path -File
    }

    if ($k) {
        $Files | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1kB)) + "kB"};align="right"}
    } elseif ($M) {
        $Files | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1MB)) + "MB"};align="right"}
    } elseif ($G) {
        $Files | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1GB)) + "GB"};align="right"}
    } elseif ($h) {
        $Files | Format-Table Name, @{n="Size";e={
            if ($_.Length -lt 1kB) {
                $_.Length
            } elseif ($_.Length -lt 1MB) {
                ("{0:f3}" -f ($_.Length/1kB)) + "kB"
            } elseif ($_.Length -lt 1GB) {
                ("{0:f3}" -f ($_.Length/1MB)) + "MB"
            } else {
                ("{0:f3}" -f ($_.Length/1GB)) + "GB"
            }
        };align="right"}
    } else {
        $Files | Format-Table Name, @{n="Size";e={$_.Length};align="right"}
    }
}