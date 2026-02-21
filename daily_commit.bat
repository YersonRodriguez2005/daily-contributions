@echo off
:: Espera 30 segundos para asegurar conexión a internet
timeout /t 30 /nobreak

:: Entrar a la carpeta
cd /d "C:\Users\Acer\Documents\GitHub\daily-contributions"

:: Bucle de 5 commits
for /l %%x in (1, 1, 5) do (
    echo Intento %%x: %date% %time% >> log.txt
    git add log.txt
    git commit -m "auto: daily contribution %%x/5"
    timeout /t 1 >nul
)

:: Subir cambios (Como ya configuramos SSH, no pedirá clave)
git push origin main