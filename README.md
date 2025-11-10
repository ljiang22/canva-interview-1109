# Interview Canva

Python project for interview-related tasks.

## Setup

### Prerequisites
- Python 3.10 or higher
- pip

### Quick Setup

**Linux/Mac:**
```bash
chmod +x setup.sh
./setup.sh
```

**Windows (PowerShell):**
```powershell
.\setup.ps1
```

### Manual Setup

1. **Set Python version** (if using pyenv):
   ```bash
   pyenv install 3.11
   pyenv local 3.11
   ```

2. **Create virtual environment:**
   ```bash
   python3 -m venv .venv
   ```

3. **Activate virtual environment:**
   - Linux/Mac: `source .venv/bin/activate`
   - Windows: `.venv\Scripts\activate` (PowerShell) or `.venv\Scripts\activate.bat` (CMD)

4. **Install dependencies:**
   ```bash
   pip install -e ".[dev]"
   ```

5. **Install pre-commit hooks:**
   ```bash
   pre-commit install
   ```

6. **Run pre-commit on all files:**
   ```bash
   pre-commit run --all-files
   ```

## Development

### Running Tests
```bash
pytest
```

### Running Tests with Coverage
```bash
pytest --cov
```

### Code Formatting
```bash
black .
```

### Linting
```bash
ruff check .
```

### Type Checking
```bash
mypy .
```

### Running All Quality Checks
```bash
pre-commit run --all-files
```

## Project Structure

```
.
├── .gitignore
├── .pre-commit-config.yaml
├── pyproject.toml
├── README.md
├── setup.sh          # Linux/Mac setup script
├── setup.ps1         # Windows setup script
└── template/         # Project templates
```

## Dependencies

Development dependencies are managed in `pyproject.toml`:
- **black**: Code formatter
- **ruff**: Fast linter
- **mypy**: Static type checker
- **pytest**: Testing framework
- **pytest-cov**: Coverage plugin
- **pre-commit**: Git hooks framework

