@echo off
:: 1. Esperar 30 segundos a que el Wi-Fi conecte
timeout /t 30 /nobreak

:: 2. Ir a la carpeta del proyecto (CAMBIA ESTA RUTA)
cd /d "C:\Users\Acer\Documents\GitHub\daily-contributions"

:: 3. Verificar conexión a Internet
ping -n 1 github.com >nul
if errorlevel 1 (
    echo Sin conexion, reintentando...
    timeout /t 10
    goto 2
)

:: 4. Bucle para realizar 5 contribuciones
echo Iniciando rafaga de 5 commits...
for /l %%x in (1, 1, 5) do (
    echo Intento %%x el %date% a las %time% >> log.txt
    git add log.txt
    git commit -m "feat: daily batch contribution %%x/5 - %date%"
    timeout /t 1 >nul
)

:: 5. Un solo push para subir los 5 commits juntos
git push origin main
echo Proceso completado exitosamente.