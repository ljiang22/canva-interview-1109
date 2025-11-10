# Initialize git repository (if not already initialized)
if (-not (Test-Path .git)) {
    Write-Host "Initializing git repository..." -ForegroundColor Green
    git init
}

# Configure git user (if not already configured)
$gitName = git config user.name
if ([string]::IsNullOrEmpty($gitName)) {
    Write-Host "Configuring git user..." -ForegroundColor Green
    $gitName = Read-Host "Enter your git user name"
    $gitEmail = Read-Host "Enter your git email"
    git config user.name $gitName
    git config user.email $gitEmail
}

# Add all files
Write-Host "Adding files to git..." -ForegroundColor Green
git add .

# Make initial commit
Write-Host "Making initial commit..." -ForegroundColor Green
git commit -m "Initial commit"

# Ask for GitHub repository URL
Write-Host ""
Write-Host "To connect to GitHub:" -ForegroundColor Yellow
Write-Host "1. Create a new repository on GitHub (if you haven't already)"
Write-Host "2. Copy the repository URL (e.g., https://github.com/username/repo-name.git)"
Write-Host ""
$repoUrl = Read-Host "Enter your GitHub repository URL (or press Enter to skip)"

if ($repoUrl) {
    Write-Host "Adding remote origin..." -ForegroundColor Green
    git remote add origin $repoUrl 2>$null
    if ($LASTEXITCODE -ne 0) {
        git remote set-url origin $repoUrl
    }
    Write-Host "Pushing to GitHub..." -ForegroundColor Green
    git branch -M main
    git push -u origin main
    Write-Host "Done! Repository connected to GitHub." -ForegroundColor Green
} else {
    Write-Host "Skipped GitHub connection. You can add it later with:" -ForegroundColor Yellow
    Write-Host "  git remote add origin <your-repo-url>"
    Write-Host "  git branch -M main"
    Write-Host "  git push -u origin main"
}

