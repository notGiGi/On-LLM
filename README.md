# On-LLM

Fundamentals of LLMs with math-first explanations and runnable PyTorch demos.

## Quickstart (one command)

### Windows (PowerShell)
scripts\install.ps1
jupyter lab

### macOS / Linux (bash)
bash scripts/install.sh
jupyter lab

Notes:
- The installer creates a virtual environment (or you can use Conda).
- It installs: requirements, Jupyter Lab, Jupytext, and registers a kernel `on-llm`.
- If `notebooks/block1_foundations.md` exists, it is converted to `.ipynb` automatically.

## VS Code Quickstart

1) Abre esta carpeta en VS Code.
2) Instala las extensiones recomendadas (te las sugerirá VS Code):
   - Python (ms-python.python)
   - Jupyter (ms-toolsai.jupyter)
3) Ejecuta **Terminal → Run Task… → "Setup (Windows, pip)"** (o la de macOS/Linux).
4) Abre cualquier `.ipynb` y selecciona el kernel **Python (on-llm)** si no aparece automático.

> No se abrirá navegador: Jupyter corre integrado en VS Code.  
> El intérprete del proyecto apunta a `.venv` (configurado en `.vscode/settings.json`).
