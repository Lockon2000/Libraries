function ToArray {
    param($Arraylike)

    [system.collections.arraylist]$Array = @()
    foreach ($Item in $Arraylike) {
        [void]$Array.Add($Item)
    }

    return $Array
}


function Start-ElevatedSession {
    param([switch]$PreserveCurrent)

    Start-Process pwsh.exe -Verb runAs -ArgumentList "-NoExit -Command cd '$PWD'"
    if (-not $PreserveCurrent) {
        Exit
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

    $Path = (Resolve-Path $Path).ToString().trim('\')
    # If ($Path[-1] -eq "\") {
    #     $Path = 
    # }

    if ($Recurse) {
        $Items = Get-ChildItem -Path $Path -Force -Recurse
    } else {
        $Items = Get-ChildItem -Path $Path -Force
    }

    $Total = 0
    ForEach ($Item in $Items) {
        If ($Item.PSIsContainer) {
            $Item | Add-Member -NotePropertyName Length -NotePropertyValue (Get-DirectorySize $Item.PSPath)
        }

        If ((Split-Path $Item.FullName) -eq $Path) {
            $Total += $Item.Length
        }
    }


    if ($k) {
        $Items | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1kB)) + "kB"};align="right"}
    } elseif ($M) {
        $Items | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1MB)) + "MB"};align="right"}
    } elseif ($G) {
        $Items | Format-Table Name, @{n="Size";e={("{0:f3}" -f ($_.Length/1GB)) + "GB"};align="right"}
    } elseif ($h) {
        $Items | Format-Table Name, @{n="Size";e={
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
        $Items | Format-Table Name, @{n="Size";e={$_.Length};align="right"}
    }

    [pscustomobject]@{Name="Total";Length=$Total} | Format-Table Name, @{n="Size";e={
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
}


function Get-DirectorySize {
    param([String]$Path=".")

    $Contents = Get-ChildItem -Path $Path

    $Sum = 0
    ForEach ($Item in $Contents) {
        If ($Item.PSIsContainer) {
            $Sum += Get-DirectorySize $Item.PSPath
        } Else {
            $Sum += $Item.Length
        }
    }

    Return $Sum
}


function Get-PublicIP {
    param([Switch]$Full)

    if (!$Full) {
        Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
    } else {
        Invoke-RestMethod http://ipinfo.io/json
    }
}


function Get-AllGitSubdirsStatus {
    dir | %{
        if (Test-Path $PSItem -PathType Container) {
            cd $PSItem.FullName
            if (Test-Path .git) {
                echo "------------ $($PSItem.BaseName) ------------"
                git remote update
                git st
            }
        }
    }

    cd ..
}

New-Alias -Name gag -Value Get-AllGitSubdirsStatus

function Sync-AllGitSubdirs {
    dir | %{
        if (Test-Path $PSItem -PathType Container) {
            cd $PSItem.FullName
            if (Test-Path .git) {
                echo "------------ $($PSItem.BaseName) ------------"
                git pull
                git st
            }
        }
    }

    cd ..
}

New-Alias -Name sag -Value Sync-AllGitSubdirs


Export-ModuleMember -Function * -Alias * -Variable *
