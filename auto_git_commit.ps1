Set-Location "D:\University of Bremen\StartUp\Website"

# Check for ALL changes (including untracked files)
$status = git status --porcelain

if ($status) {
    Write-Host "Changes found. Staging, committing, and pushing..."
    
    # Stage all changes
    git add .
    
    # Check if there are any ignored files that need force-adding
    $ignoredFiles = git ls-files --others --exclude-standard
    if ($ignoredFiles) {
        Write-Host "Found ignored files. Forcing add..."
        $ignoredFiles | ForEach-Object { git add -f $_ }
    }
    
    $commitMessage = "Automated commit: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")"
    git commit -m $commitMessage
    git push origin master
    Write-Host "Changes committed and pushed successfully."
} else {
    Write-Host "No uncommitted changes."
}