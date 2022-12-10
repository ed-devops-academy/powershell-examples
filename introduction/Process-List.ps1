#!/usr/bin/pwsh

# Example using foreach to process a list of objects

Get-Process | ForEach-Object -Begin {
    Write-Host "Begining showing process list"
} -Process {
    Write-Host $_.Name -ForegroundColor Green
    $startTime = $_.StartTime
    $exitTime = $_.ExitTime
    Write-Host "Start time $startTime"

    if ($exitTime -eq $null ) {
        $currentTime = Get-Date
        $executingTime = (New-TimeSpan -Start $startTime -End $currentTime)
        Write-Host "Total executing time $executingTime"
    } else {
        Write-Host "Exit time $exitTime"
    }

} -End {
    Write-Host "Finnishing showing process list"
}