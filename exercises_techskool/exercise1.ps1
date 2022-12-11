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
        New-Item -ItemType Directory -Path "$subfolderPath"
    }
    else {
        Write-Host "$subfolderPath already exists"
    }
    return $subfolderPath
}

# Solving part 1

$testingPurposePath = "$TestFolderPath/TestingPurpose"
if (-Not (Test-Path $testingPurposePath)) {
    New-Item -ItemType Directory -Path "$testingPurposePath"
}else{
    Write-Host "$testingPurposePath already exists"
}

$subFoldersPaths = @()

for ($i = 1; $i -le 3; $i++) {
    $subFoldersPaths += New-SubFolder -subfolderIndex $i -testingFolderPath $testingPurposePath
}



# Solving part 2
for ($i = 1; $i -le 100 ; $i++) {
    switch ($i) {
        { $i -ge 1 -and $i -le 50 } { 
            $firstSubfolderPath = $subFoldersPaths[0]
            $newItemPath = "$firstSubfolderPath/TypeATest$i.txt"
            if (-Not (Test-Path $newItemPath)) {
                New-Item -ItemType File -Path $newItemPath
            }
            else {
                Write-Host "$newItemPath already exists."
            }
        }
        Default {}
    }
}