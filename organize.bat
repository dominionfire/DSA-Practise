@echo off
mkdir python 2>nul
mkdir sql 2>nul
mkdir ml 2>nul

REM Move SQL files
move *.sql sql\ >nul 2>&1

REM Check for ML-related Python files
for %%f in (*.py) do (
    findstr /I "sklearn tensorflow keras pandas xgboost lightgbm" "%%f" >nul
    if %errorlevel%==0 (
        move "%%f" ml\ >nul
    ) else (
        move "%%f" python\ >nul
    )
)

echo ✅ Files organized by type!