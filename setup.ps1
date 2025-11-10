# Setup script for Python project environment (PowerShell)

Write-Host "=== Python Project Setup ===" -ForegroundColor Cyan

# Step 1: Check Python version
Write-Host "`nStep 1: Checking Python version..." -ForegroundColor Yellow
$pythonVersion = python --version 2>&1
if ($LASTEXITCODE -ne 0) {
    $pythonVersion = python3 --version 2>&1
}
Write-Host "Found $pythonVersion"

# Step 2: Create virtual environment
Write-Host "`nStep 2: Creating virtual environment..." -ForegroundColor Yellow
if (Test-Path ".venv") {
    Write-Host ".venv already exists, skipping creation" -ForegroundColor Gray
} else {
    python -m venv .venv
    if ($LASTEXITCODE -ne 0) {
        python3 -m venv .venv
    }
    Write-Host "Virtual environment created" -ForegroundColor Green
}

# Step 3: Activate virtual environment
Write-Host "`nStep 3: Activating virtual environment..." -ForegroundColor Yellow
& .\.venv\Scripts\Activate.ps1

# Step 4: Upgrade pip
Write-Host "`nStep 4: Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Step 5: Install dev tools
Write-Host "`nStep 5: Installing dev tools..." -ForegroundColor Yellow
pip install -e ".[dev]"

# Step 6: Install pre-commit hooks
Write-Host "`nStep 6: Installing pre-commit hooks..." -ForegroundColor Yellow
pre-commit install

# Step 7: Run pre-commit on all files
Write-Host "`nStep 7: Running pre-commit on all files..." -ForegroundColor Yellow
pre-commit run --all-files

Write-Host "`n=== Setup Complete ===" -ForegroundColor Green
Write-Host "To activate the virtual environment in the future, run:" -ForegroundColor Cyan
Write-Host "  .\.venv\Scripts\Activate.ps1" -ForegroundColor White

