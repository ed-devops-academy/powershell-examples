Param(
    [string]$Path = $Profile.CurrentUserCurrentHost,
    [string]$ForegroundColor = "Green",
    [string]$WelcomeText = "`"Hello Developer, welcome back`""
)

New-Item -ItemType "file" -Value "Write-Host $WelcomeText -foregroundcolor $ForegroundColor " -Path $Profile.CurrentUserCurrentHost -Force
Write-Host "Updated profile $Path"
