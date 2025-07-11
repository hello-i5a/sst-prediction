@echo off
cd ..

REM Launch MLflow tracking server with organized mlruns folder
python -m mlflow server ^
  --backend-store-uri sqlite:///mlruns/mlflow.db ^
  --default-artifact-root ./mlruns/artifacts ^
  --host 127.0.0.1 ^
  --port 5000

cd scripts
