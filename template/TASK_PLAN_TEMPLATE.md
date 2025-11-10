# Task Plan: [Task Title]

## 1. Objective

**Goal:** [Clear statement of what needs to be accomplished]

**Why:** [Explanation of the purpose and value of this task]

**Priority:** [High/Medium/Low]

**Estimated Complexity:** [Simple/Moderate/Complex]

---

## 2. Context

### Current State
[Describe the existing codebase, features, or situation that this task relates to]

### Background Information
[Any relevant background, user stories, or business requirements]

### Related Issues/Tasks
[Links or references to related work, dependencies, or blocking tasks]

### Python Project Context
- **Python Version:** [3.10/3.11/3.12] (Specify exact minor version)
- **Project Layout:** [Root-level modules (preferred here) | src/ package]
- **Style Guide:** PEP 8 + project rules (line length 88 via Black)
- **Testing Framework:** pytest
- **Type Checking:** mypy (targets and strictness)
- **Linting/Formatting:** Ruff + Black (and isort if separate)
- **Packaging/Deps:** pyproject.toml (+ lockfile)
- **Logging:** Python `logging` module, no print in production code

---

## 3. Requirements

### Functional Requirements
- [ ] [Requirement 1: What the system must do]
- [ ] [Requirement 2: What the system must do]
- [ ] [Requirement 3: What the system must do]

### Non-Functional Requirements (Python-Specific)
- [ ] Enforce style (Black 88 chars) and lint (Ruff) with zero errors
- [ ] Static typing with mypy (no errors; specify strictness)
- [ ] Unit + integration tests (pytest) with coverage ≥ [90%]
- [ ] Reproducible env: venv + pinned deps ([requirements.txt | pyproject.lock])
- [ ] CI pipeline runs: format, lint, type-check, tests on push/PR
- [ ] Compatibility: Python [exact version], OS [linux] parity
- [ ] Security: no secrets in repo, dependency audit, safe file I/O
- [ ] Maintainability: Google-style docstrings, function length < 50 lines
- [ ] Observability: structured logging with context; avoid prints

### Constraints
- [Any limitations, restrictions, or boundaries]
- [Budget, time, or resource constraints]

---

## 4. Implementation Plan

### Overview
[High-level approach and strategy for implementing this task]

### Detailed Steps

#### Step 1: Environment & Tooling Setup
**Purpose:** Ensure a reproducible Python environment and quality gates.

**Actions:**
1. Set Python version ([pyenv] or system): `3.[x]`
2. Create venv: `python -m venv .venv` and activate
3. Choose dependency management:
   - `pyproject.toml` (poetry/pdm)
4. Install dev tools: `black ruff mypy pytest pytest-cov pre-commit`
5. Add `.gitignore` (venv, __pycache__, etc.)
6. Configure pre-commit hooks (black, ruff, mypy, end-of-file-fixer)
7. Pin deps (freeze or lockfile)

**Dependencies:** None

**Estimated Time:** [0.5–1.5h]

---

#### Step 2: Configuration Files
**Purpose:** Centralize project configuration for consistency and CI.

**Actions:**
1. Add `pytest.ini` (testpaths, addopts: `-v --tb=short --cov`)
2. Configure `pyproject.toml` OR individual configs:
   - Black (line-length 88, target-version)
   - Ruff (rules, select/ignore, isort settings)
   - Mypy (`mypy.ini`): disallow-any-generics, warn-redundant-casts, etc.
   - Coverage (`.coveragerc`): omit tests, config for branch coverage
3. Create `.pre-commit-config.yaml` with hooks

**Dependencies:** Step 1

**Estimated Time:** [0.5–1h]

---

#### Step 3: Project Structure & Scaffolding
**Purpose:** Establish clean, simple, Pythonic structure.

**Actions:**
1. Confirm root-level modules layout (per project rules)
2. Create `tests/`, `tests/fixtures/`, `docs/` (optional)
3. Add `README.md` basics: setup, run, tests
4. Add initial modules: `[module_name].py`, `main.py` (if CLI/entry)

**Dependencies:** Steps 1–2

**Estimated Time:** [0.5–1h]

---

#### Step 4: Implementation (Business Logic)
**Purpose:** Build the core functionality with types, docs, and tests in mind.

**Actions:**
1. Add/modify functions/classes in `[module].py` with type hints
2. Write Google-style docstrings and meaningful errors
3. Keep functions < 50 lines; extract helpers to avoid deep nesting
4. Add logging (no prints), avoid global state, avoid magic numbers

**Dependencies:** Steps 1–3

**Estimated Time:** [Varies]

---

#### Step 5: Testing
**Purpose:** Ensure correctness with unit and integration tests.

**Actions:**
1. Create/expand `tests/test_[module].py` with parameterized cases
2. Add fixtures in `tests/conftest.py` and `tests/fixtures/*`
3. Run `pytest --cov` and address failures
4. Add edge cases and error-path tests

**Dependencies:** Steps 3–4

**Estimated Time:** [0.5–2h]

---

#### Step 6: Quality Gates & CI
**Purpose:** Enforce code quality and prevent regressions.

**Actions:**
1. Run `black .`, `ruff .`, `mypy .`
2. Ensure `pytest` coverage ≥ [90%]
3. Validate CI passes on branch and PR

**Dependencies:** Steps 1–5

**Estimated Time:** [0.5–1h]

---

[Add more steps as needed]

---

## 5. Files to Create/Modify

### New Files
| File Path | Purpose | Key Components |
|-----------|---------|----------------|
| `requirements.txt` or `pyproject.toml` | Dependency management | Pinned runtime + dev deps |
| `pytest.ini` | Pytest configuration | `testpaths`, `addopts`, markers |
| `.pre-commit-config.yaml` | Local quality gates | black, ruff, mypy, eol fixer |
| `.gitignore` | Ignore artifacts | venv, __pycache__, .pytest_cache |
| `mypy.ini` (if not in pyproject) | Type checker config | strictness toggles |
| `ruff.toml` (if not in pyproject) | Linting config | rule selection, isort |
| `.coveragerc` | Coverage config | omit patterns, branch=True |
| `.github/workflows/ci.yml` | CI pipeline | setup-python, cache, checks |
| `tests/conftest.py` | Shared fixtures | reusable fixtures, hooks |
| `tests/test_[module].py` | Unit tests | test functions and parametrization |

### Modified Files
| File Path | Changes Required | Reason |
|-----------|------------------|--------|
| `[existing/module].py` | Implement functions with types & docs | Add business logic |
| `README.md` | Setup, run, test instructions | Developer onboarding |
| `main.py` (if applicable) | Entry point wiring | CLI or script flow |

---

## 6. Technical Considerations

### Architecture & Design
- **Design Pattern:** [Functional-first; Strategy; Adapter; etc.]
- **Data Structures:** [TypedDict/Dataclass vs dicts; lists vs tuples]
- **Algorithms:** [Choices and complexity]; ensure clear invariants

### Code Quality (Python)
- **Naming:** snake_case functions/vars, PascalCase classes
- **Type Hints:** All public functions; prefer precise types
- **Docstrings:** Google-style; include Args/Returns/Raises/Examples
- **Error Handling:** Specific exceptions; add context in messages
- **Logging:** Use `logging` with module-level loggers

### Dependencies
- **New Dependencies:** [Any new packages to install]
  - `package_name==version` — [Why needed]
- **Existing Dependencies:** [Dependencies already in use]
- Prefer minimal deps; pin versions; audit for vulnerabilities

### Performance Considerations
- **Time Complexity:** [Expected]
- **Space Complexity:** [Expected]
- **Optimization Opportunities:** Avoid N+1 I/O; use generators; cache if needed

### Security Considerations
- Validate inputs; avoid eval/exec
- No secrets in code or logs; use env vars
- Safe file I/O paths; sanitize external data
- Optional: run `bandit` for static security checks

---

## 7. Testing Strategy

### Unit Tests
**Location:** `tests/test_[module_name].py`

**Test Cases:**
- [ ] `test_[function_name]_[scenario]`: [What it tests]
- [ ] `test_[function_name]_edge_case`: [Edge case description]
- [ ] `test_[function_name]_error_handling`: [Error scenario]
- [ ] `test_[class_name]_[method]_[scenario]`: [What it tests]

### Integration Tests
**Location:** `tests/integration/test_[feature].py`

**Test Cases:**
- [ ] [Integration test 1: Description]
- [ ] [Integration test 2: Description]

### Fixtures & Data
- Use `tests/conftest.py` for shared fixtures
- Place static data under `tests/fixtures/`
- Mock external services/IO; avoid network in unit tests

### Coverage & Quality
- Enforce coverage ≥ [90%] overall and on changed files
- Run `pytest -n auto --cov` locally and in CI

### Manual Testing
**Steps:**
1. [Manual verification step 1]
2. [Manual verification step 2]
3. [Manual verification step 3]

**Expected Results:**
- [What should happen when testing manually]

---

## 8. Success Criteria

### Definition of Done
- [ ] All functional requirements implemented
- [ ] Code follows style guide; `black` and `ruff` pass
- [ ] `mypy` passes with configured strictness
- [ ] Unit + integration tests with coverage ≥ [90%]
- [ ] No linter errors; no TODOs left in code
- [ ] Code reviewed and approved
- [ ] Documentation updated (README, API docs)
- [ ] CI green on default branch

### Acceptance Criteria
- [ ] [Specific measurable outcome 1]
- [ ] [Specific measurable outcome 2]
- [ ] [Specific measurable outcome 3]

---

## 9. Risks and Mitigation

| Risk | Likelihood | Impact | Mitigation Strategy |
|------|------------|--------|---------------------|
| Dependency conflicts | Med | Med | Pin versions; lockfile; CI matrix |
| Env mismatch (local vs CI) | Med | Med | Use exact Python version; document setup |
| Flaky tests | Med | Med | Deterministic fixtures; seed RNG; isolate IO |
| Type hint drift | Low | Low | Enforce mypy in CI; pre-commit gate |
| Performance regressions | Low | Med | Add benchmarks; monitor hot paths |

---

## 10. Additional Notes

### Assumptions
- Python `[3.x]` with venv available
- Linux target environment; paths are absolute where possible

### Out of Scope
- [What is explicitly not included in this task]
- [What should be addressed in future tasks]

### References
- PEP 8, Google-style docstrings
- Project style and structure rules
- Tool docs: Black, Ruff, Mypy, Pytest

### Questions/Clarifications Needed
- [ ] [Question 1 that needs answering]
- [ ] [Question 2 that needs answering]

---

## 11. Progress Tracking

### Status: [Not Started / In Progress / Blocked / Completed]

**Started:** [Date]

**Last Updated:** [Date]

**Completed:** [Date]

### Checklist
- [ ] Step 1 completed
- [ ] Step 2 completed
- [ ] Step 3 completed
- [ ] Testing completed
- [ ] Documentation completed
- [ ] Code review completed

### Notes During Implementation
[Use this section to document decisions made, issues encountered, or deviations from the plan during implementation]

---

## Template Usage Instructions

### For AI Coding Agents (Python Project)
1. Read the entire template before implementation
2. Fill every section with concrete, measurable details
3. Create/modify only the files listed in section 5
4. Use absolute paths for file references
5. Use type hints and Google-style docstrings for all public APIs
6. Keep functions < 50 lines; extract helpers early
7. Prefer list comprehensions; avoid deep nesting
8. Write or update tests alongside code; aim for ≥ [90%] coverage
9. Run locally: `black`, `ruff`, `mypy`, `pytest --cov` before committing
10. Use pre-commit; commit small, logically grouped edits
11. In reviews, link to specific functions/files; explain deviations

### Best Practices
- Be specific with file paths (absolute when possible)
- Include code snippets or examples where helpful
- Reference existing code that will be modified
- Consider edge cases and error scenarios
- Plan for rollback if implementation fails
- Keep the plan updated as requirements change
- Never commit secrets; use env vars and local configs
- Prefer `logging` over `print` in production paths