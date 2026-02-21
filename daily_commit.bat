@echo off
:: 1. Esperar 30 segundos a que el Wi-Fi conecte
timeout /t 30 /nobreak

:: 2. Ir a la carpeta del proyecto (CAMBIA ESTA RUTA)
cd /d "C:\Users\TuUsuario\Documents\GitHub\daily-contributions"

:: 3. Verificar si hay internet haciendo ping a GitHub
ping -n 1 github.com >nul
if errorlevel 1 (
    echo "Sin conexión a internet. Reintentando en 10 segundos..."
    timeout /t 10
    goto 2
)

:: 4. Realizar el cambio y el commit
echo Ultima contribución: %date% %time% >> log.txt
git add log.txt
git commit -m "feat: daily automated contribution %date%"

:: 5. Push silencioso
git push origin main