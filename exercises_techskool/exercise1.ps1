#!/usr/bin/pwsh

Param(
    $SourcePath,
    [string]$TestFolderPath = './exercises_techskool/output_folder'
)

function New-SubFolder {
    param (
        [Parameter(Mandatory)]
        $subfolderIndex,
        $testingFolderPath
    )
    $subfolderPath = "$testingFolderPath/SubFolder$subfolderIndex"

    if (-Not (Test-Path $subfolderPath)) {
        New-Item -ItemType Directory -Path $subfolderPath
    }
    else {
        Write-Host "$subfolderPath already exists"
    }
}
function New-File {
    param (
        [string][Parameter(Mandatory)]
        $filePath,
        [string][Parameter(Mandatory)]
        $fileName
    )

    if (-Not (Test-Path "$filePath/$fileName")) {
        New-Item -ItemType File -Path $filePath -Name $fileName
    }
    else {
        Write-Host "$filePath/$fileName already exists"
    }
}

# Solving part 1

$testingPurposePath = "$TestFolderPath/TestingPurpose"
if (-Not (Test-Path $testingPurposePath)) {
    New-Item -ItemType Directory -Path $testingPurposePath
}
else {
    Write-Host "$testingPurposePath already exists"
}

$subFoldersPaths = [System.Collections.Generic.List[string]]::new()

foreach ($value in 1..3) {
    $subFoldersPaths.Add((New-SubFolder -subfolderIndex $value -testingFolderPath $testingPurposePath))
}

# Solving part 2
$subFoldersPaths
for ($i = 1; $i -le 100 ; $i++) {
    switch ($i) {
        { $i -ge 1 -and $i -le 50 } { 
            $firstSubfolderPath = $subFoldersPaths[0]
            New-File -filePath $firstSubfolderPath -fileName "TypeATest$i.txt"
        }
        { $i -gt 50 } {
            $secondSubfolderPath = $subFoldersPaths[1]
            $subFoldersPaths[1]

            $randomSwitch = Get-Random -Minimum 0 -Maximum 1
            if ( $randomSwitch -eq 0 ) {
                New-File -filePath $secondSubfolderPath -fileName "TypeBTest$i.txt"
            }
            else {
                New-File -filePath $secondSubfolderPath -fileName "Purpose$i`Test2.txt"
            }
        }
        Default {}
    }
}

# 3 and 4 answer
Get-ChildItem -Path $subFoldersPaths[0], $subFoldersPaths[1]
| ForEach-Object {
    $fileName = $_.Name
    $pattern = "\w+(?<number>\d+)\w*.txt"
    $results = [Regex]::Matches($fileName, $Pattern)
    $number = [int]$results[0].Groups["number"].Value
    if ( $number % 2 -eq 0 ) {
        Move-Item -Path $_.FullName -Destination $subFoldersPaths[0]
    }
    else {
        Move-Item -Path $_.FullName -Destination $subFoldersPaths[1]
    }
}