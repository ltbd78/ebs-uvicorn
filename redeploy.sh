deactivate
set -eu -o pipefail
rm -rf .venv
python -m venv .venv
source .venv/bin/activate
pip install -e .
pip freeze > requirements.txt
grep -vE "^(\s*#|-e)" requirements.txt > requirements_clean.txt
mv requirements_clean.txt requirements.txt
echo sandbox-0.0.1-py3-none-any.whl >> requirements.txt
pip install -e ".[dev]"
python -m build --wheel
