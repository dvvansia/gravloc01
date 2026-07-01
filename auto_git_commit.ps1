
Set-Location "D:\University of Bremen\StartUp\Website"

# Check for uncommitted changes
$status = git status --porcelain

if ($status) {
    Write-Host "Uncommitted changes found. Staging, committing, and pushing..."
    git add .
    $commitMessage = "Automated commit: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")"
    git commit -m $commitMessage
    git push origin main
    Write-Host "Changes committed and pushed successfully."
} else {
    Write-Host "No uncommitted changes."
}
