#!/bin/bash
# Setup script for Python project environment

set -e

echo "=== Python Project Setup ==="

# Step 1: Check Python version
echo "Step 1: Checking Python version..."
PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
echo "Found Python $PYTHON_VERSION"

# Step 2: Create virtual environment
echo ""
echo "Step 2: Creating virtual environment..."
if [ -d ".venv" ]; then
    echo ".venv already exists, skipping creation"
else
    python3 -m venv .venv
    echo "Virtual environment created"
fi

# Step 3: Activate virtual environment
echo ""
echo "Step 3: Activating virtual environment..."
source .venv/bin/activate

# Step 4: Upgrade pip
echo ""
echo "Step 4: Upgrading pip..."
pip install --upgrade pip

# Step 5: Install dev tools
echo ""
echo "Step 5: Installing dev tools..."
pip install -e ".[dev]"

# Step 6: Install pre-commit hooks
echo ""
echo "Step 6: Installing pre-commit hooks..."
pre-commit install

# Step 7: Run pre-commit on all files
echo ""
echo "Step 7: Running pre-commit on all files..."
pre-commit run --all-files || true

echo ""
echo "=== Setup Complete ==="
echo "To activate the virtual environment in the future, run:"
echo "  source .venv/bin/activate"

