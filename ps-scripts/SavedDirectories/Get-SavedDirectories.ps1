. $PSScriptRoot\includes\SavedDirectories-Shared.ps1

$RecentDirectories = Get-Content $PATH_FILE_SAVED_DIRS
foreach ($line in $RecentDirectories) {
    Write-Host $line
}

