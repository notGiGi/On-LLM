# scripts\install.ps1
$ErrorActionPreference = "Stop"

# 1) Crear/usar venv sin recrearlo si ya existe
if (-not (Test-Path ".venv")) {
  Write-Host ">>> Creating venv at .venv"
  py -3 -m venv .venv
}

# 2) Activar venv
.\.venv\Scripts\Activate

# 3) Instalar deps
Write-Host ">>> Upgrading pip"
python -m pip install --upgrade pip
Write-Host ">>> Installing requirements"
pip install -r requirements.txt

# 4) Registrar kernel (no inicia servidor)
Write-Host ">>> Registering Jupyter kernel 'on-llm'"
python -m ipykernel install --user --name on-llm --display-name "Python (on-llm)"

# 5) (Opcional) convertir .md a .ipynb si existe
if (Test-Path "notebooks\block1_foundations.md") {
  jupytext --to notebook notebooks\block1_foundations.md
}

Write-Host "✅ Listo. Abre VS Code, selecciona el kernel 'Python (on-llm)' y trabaja."
