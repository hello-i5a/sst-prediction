@echo off
cd ..

REM Ensure mlruns folder exists
if not exist "mlruns" mkdir "mlruns"

REM Use absolute path for better SQLite compatibility
set "MLRUNS_DIR=%cd%\mlruns"

REM Convert to URI format for MLflow (slashes instead of backslashes)
set "BACKEND_URI=sqlite:///%MLRUNS_DIR:\=/%/mlflow.db"
set "ARTIFACT_ROOT=%MLRUNS_DIR:\=/%/artifacts"

REM Start the MLflow server
python -m mlflow server ^
  --backend-store-uri %BACKEND_URI% ^
  --default-artifact-root %ARTIFACT_ROOT% ^
  --host 127.0.0.1 ^
  --port 5000

cd scripts
