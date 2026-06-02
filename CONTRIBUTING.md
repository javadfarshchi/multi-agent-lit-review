# Contributing

Thank you for your interest in this project.

## Reporting Issues

Use the issue templates. Include your Python version, OS, and the relevant package versions listed in the bug report template.

## Suggesting Improvements

Open a Discussion (not an issue) for methodology questions or enhancement ideas. Issues are reserved for reproducible bugs.

## Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Ensure `pre-commit run --all-files` passes before committing
4. Keep notebook outputs stripped: `nbstripout notebook.ipynb`
5. Update relevant docstrings and README sections if behavior changes
6. Open a PR with a clear description of what changes and why

## Environment Setup

```bash
git clone https://github.com/javadfarshchi/multi-agent-lit-review
cd multi-agent-lit-review
python -m venv .venv
source .venv/bin/activate        # Linux / macOS
# .venv\Scripts\activate         # Windows
pip install -r requirements.txt -r requirements-dev.txt
pre-commit install
nbstripout --install              # strip notebook outputs on git add
```

## Code Style

- Python formatting: `black` (line length 88)
- Import ordering: `isort` with `--profile black`
- Linting: `ruff`
- All enforced automatically by pre-commit

## Docstring Style

Google style docstrings throughout.

## Notebook Conventions

- Outputs must be stripped before commit (`nbstripout` pre-commit hook handles this)
- Each section begins with a Markdown cell explaining the purpose, design choices, and tradeoffs
- No hardcoded absolute paths; use relative paths or configuration constants
