Param(
  [switch]$Conda,
  [switch]$NoJupytext
)

$ErrorActionPreference = "Stop"
Write-Host "== On-LLM :: Windows setup ==" -ForegroundColor Cyan

# Activar conda o venv
if ($Conda) {
  Write-Host "Using Conda env: on-llm" -ForegroundColor Yellow
  conda env remove -n on-llm -y 2>$null | Out-Null
  conda create -n on-llm python=3.11 -y | Out-Null
  conda activate on-llm
} else {
  if (-not (Test-Path ".\.venv")) { python -m venv .venv }
  . .\.venv\Scripts\Activate.ps1
}

python -m pip install -U pip setuptools wheel
pip install -r requirements.txt
pip install jupyterlab notebook ipykernel
if (-not $NoJupytext) { pip install jupytext }

if ((-not $NoJupytext) -and (Test-Path "notebooks\block1_foundations.md")) {
  jupytext --to ipynb notebooks\block1_foundations.md
}

python -m ipykernel install --user --name on-llm

Write-Host "`n✔ Setup complete. Launch Jupyter with:  jupyter lab" -ForegroundColor Green
