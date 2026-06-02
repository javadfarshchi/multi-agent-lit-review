.PHONY: install lint format clean strip-outputs help

help:
	@echo "Available targets:"
	@echo "  install        Install runtime and dev dependencies, set up pre-commit and nbstripout"
	@echo "  lint           Run all pre-commit hooks against all files"
	@echo "  format         Run black and isort formatters in-place"
	@echo "  strip-outputs  Strip notebook outputs (also runs automatically on git add)"
	@echo "  clean          Remove Python cache files and temporary artifacts"

install:
	pip install -r requirements.txt -r requirements-dev.txt
	pre-commit install
	nbstripout --install

lint:
	pre-commit run --all-files

format:
	black notebook.ipynb --check || true
	nbqa black notebook.ipynb
	nbqa isort notebook.ipynb

strip-outputs:
	nbstripout notebook.ipynb
	@echo "Notebook outputs stripped"

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	@echo "Cache files removed"
