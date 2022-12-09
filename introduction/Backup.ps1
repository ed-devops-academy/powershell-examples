#!/usr/bin/pwsh

Param(
    [string]
    [Parameter(Mandatory, HelpMessage = "Please provide a valid source path to backup")]
    $SourcePath,
    [string]$DestinationPath = './'
)

If (-Not (Test-Path $SourcePath)) {
    Write-Error "The source directory $SourcePath does not exist, please specify an existing directory"
    return
}

$currentDate = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $currentDate + '.zip')"

If (-Not (Test-Path $DestinationFile)) {  
    Compress-Archive -Path $SourcePath -CompressionLevel 'Fastest' -DestinationPath "./backup-$currentDate"
    Write-Host "Created backup at $('./backup-' + $currentDate + '.zip')"
} Else {
    Write-Error "Already exist a backup for today in $DestinationPath"
    return
}