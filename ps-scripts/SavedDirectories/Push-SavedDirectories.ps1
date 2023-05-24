. $PSScriptRoot\includes\SavedDirectories-Shared.ps1

$SIZE_QUEUE = 100

$oldDirs = Get-Content $PATH_FILE_SAVED_DIRS
$newDirs = @()
foreach ($line in $oldDirs) {
    if ([string]::IsNullOrEmpty($line)) {
        continue
    }
    if ($line -ceq $PWD) {
        $matchedLine = $line
    }
    else {
        $newDirs += $line
    }
}

if ($matchedLine) {
    $newDirs += $matchedLine
}
else {
    if ($newDirs.Count -ge $SIZE_QUEUE) {
        $newDirs = $newDirs[0..($SIZE_QUEUE-1)]
    }

    $newDirs += $PWD.ToString()
    $newDirs | Set-Content $PATH_FILE_SAVED_DIRS

    # # append current dir to file
    # $PWD.ToString() >> $PATH_FILE_SAVED_DIRS

    # # prepend current dir to file
    # $PWD | Set-Content $PATH_FILE_SAVED_DIRS
    # $oldDirs | Out-File -Append -FilePath $PATH_FILE_SAVED_DIRS -Encoding ASCII
}

# $RecentDirectories = Get-Content $PATH_FILE_SAVED_DIRS
# foreach ($line in $RecentDirectories) {
#     Write-Host $line
# }

foreach ($line in $newDirs) {
    Write-Host $line
}
