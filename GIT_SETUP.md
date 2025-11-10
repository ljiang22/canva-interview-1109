# Git Setup Guide

## Step 1: Initialize Git Repository

Run these commands in your terminal (WSL bash):

```bash
cd /home/leon/projects/interviews/interview-canva
git init
```

## Step 2: Configure Git (if not already done)

```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

## Step 3: Add Files and Make Initial Commit

```bash
git add .
git commit -m "Initial commit"
```

## Step 4: Connect to GitHub

### Option A: If you already have a GitHub repository

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

### Option B: Create a new repository on GitHub first

1. Go to https://github.com/new
2. Create a new repository (don't initialize with README, .gitignore, or license)
3. Copy the repository URL
4. Run:

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

## Quick Setup Script

You can also use the provided setup script:

**Linux/WSL:**
```bash
chmod +x setup_git.sh
./setup_git.sh
```

**Windows PowerShell:**
```powershell
.\setup_git.ps1
```

## Verify Connection

After pushing, verify with:
```bash
git remote -v
git status
```

