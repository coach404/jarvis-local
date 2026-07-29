@echo off
REM ============================================================
REM  Jutarnji Jarvis — pokreće se sam preko Windows Task Scheduler-a.
REM
REM  Radi dve stvari:
REM   1. Anja (Python + Groq) napravi digest bolnih tacaka -> outbox/
REM   2. Jarvis (claude -p, headless) napravi dnevni brifing -> outbox/
REM
REM  Nista ne salje i nista ne objavljuje. Samo pise fajlove.
REM
REM  Podesavanje: promeni JARVIS_DIR i ANJA_DIR ako su ti repoi drugde.
REM ============================================================

set JARVIS_DIR=C:\Users\Administrator\jarvis-local
set ANJA_DIR=C:\Users\Administrator\anja-agent-os

REM --- Kljucevi za Anju. Bolje: stavi ih u %ANJA_DIR%\.env pa obrisi ova 3 reda.
if "%SUPABASE_URL%"=="" set SUPABASE_URL=https://kiqvnmmrnwxbfofmkcma.supabase.co
REM set SUPABASE_SERVICE_KEY=...
REM set GROQ_API_KEY=...

echo [%date% %time%] Pokrecem jutarnji Jarvis...

REM --- 1) Anja: digest bolnih tacaka (preskace se ako venv ne postoji)
if exist "%ANJA_DIR%\.venv\Scripts\python.exe" (
  echo [1/2] Anja: daily-digest
  cd /d "%ANJA_DIR%"
  ".venv\Scripts\python.exe" -m agents.run daily-digest
) else (
  echo [1/2] Preskacem Anju - nema venv-a u %ANJA_DIR%\.venv
  echo       Napravi ga: python -m venv .venv ^&^& .venv\Scripts\activate ^&^& pip install -r requirements.txt
)

REM --- 2) Jarvis: dnevni brifing preko headless Claude Code
echo [2/2] Jarvis: /daily-briefing
cd /d "%JARVIS_DIR%"
claude -p "/daily-briefing" > "outbox\brifing-najnoviji.md" 2>&1

if errorlevel 1 (
  echo GRESKA: claude nije uspeo. Proveri 'claude --version' i 'claude doctor'.
) else (
  echo Gotovo. Brifing je u %JARVIS_DIR%\outbox\brifing-najnoviji.md
)

echo [%date% %time%] Kraj.
