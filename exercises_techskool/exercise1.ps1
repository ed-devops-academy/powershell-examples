#!/usr/bin/pwsh

Param(
    $SourcePath,
    [string]$TestFolderPath = './exercises_techskool/output_folder'
)

# Solving part 1
$testingPurposePath = "$TestFolderPath/TestingPurpose"
New-Item -ItemType Directory -Path "$testingPurposePath" 

$subfolder1Path = "$testingPurposePath/SubFolder1"
$subfolder2Path = "$testingPurposePath/SubFolder2"
$subfolder3Path = "$testingPurposePath/SubFolder3"

New-Item -ItemType Directory -Path "$subfolder1Path" 
New-Item -ItemType Directory -Path "$subfolder2Path" 
New-Item -ItemType Directory -Path "$subfolder3Path" 

# Solving part 2
for ($i = 1; $i -le 100 ; $i++) {
    switch ($i) {
        { $i -ge 1 -and $i -le 50 } { 
            New-Item -ItemType File -Path "$subfolder1Path/TypeATest$i.txt"
        }
        Default {}
    }
}