#!/usr/bin/env bash
set -euo pipefail

USE_CONDA="${1:-0}"     # 1 = conda, 0 = venv
NO_JUPYTEXT="${2:-0}"

echo "== On-LLM :: Unix setup =="

if [ "$USE_CONDA" = "1" ]; then
  echo "Using Conda env: on-llm"
  conda env remove -n on-llm -y || true
  conda create -n on-llm python=3.11 -y
  # shellcheck disable=SC1091
  source "$(conda info --base)/etc/profile.d/conda.sh"
  conda activate on-llm
else
  python3 -m venv .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
fi

python -m pip install -U pip setuptools wheel
pip install -r requirements.txt
pip install jupyterlab notebook ipykernel
if [ "$NO_JUPYTEXT" != "1" ]; then
  pip install jupytext
fi

if [ -f notebooks/block1_foundations.md ] && [ "$NO_JUPYTEXT" != "1" ]; then
  jupytext --to ipynb notebooks/block1_foundations.md
fi

python -m ipykernel install --user --name on-llm

echo
echo "✔ Setup complete. Launch Jupyter with:  jupyter lab"
