#!/bin/bash

# Initialize git repository (if not already initialized)
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
fi

# Configure git user (if not already configured)
if [ -z "$(git config user.name)" ]; then
    echo "Configuring git user..."
    read -p "Enter your git user name: " git_name
    read -p "Enter your git email: " git_email
    git config user.name "$git_name"
    git config user.email "$git_email"
fi

# Add all files
echo "Adding files to git..."
git add .

# Make initial commit
echo "Making initial commit..."
git commit -m "Initial commit"

# Ask for GitHub repository URL
echo ""
echo "To connect to GitHub:"
echo "1. Create a new repository on GitHub (if you haven't already)"
echo "2. Copy the repository URL (e.g., https://github.com/username/repo-name.git)"
echo ""
read -p "Enter your GitHub repository URL (or press Enter to skip): " repo_url

if [ -n "$repo_url" ]; then
    echo "Adding remote origin..."
    git remote add origin "$repo_url" 2>/dev/null || git remote set-url origin "$repo_url"
    echo "Pushing to GitHub..."
    git branch -M main
    git push -u origin main
    echo "Done! Repository connected to GitHub."
else
    echo "Skipped GitHub connection. You can add it later with:"
    echo "  git remote add origin <your-repo-url>"
    echo "  git branch -M main"
    echo "  git push -u origin main"
fi

