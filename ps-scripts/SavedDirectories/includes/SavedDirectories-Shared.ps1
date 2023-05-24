$PATH_FILE_SAVED_DIRS = "$HOME\saved-directories.txt"

if (!(Test-Path $PATH_FILE_SAVED_DIRS)) {
    '' | Out-File -FilePath $PATH_FILE_SAVED_DIRS
}
