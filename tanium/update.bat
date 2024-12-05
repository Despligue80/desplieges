@echo off
set LOG_FILE=C:\Forti\installation_log.txt

:: Crear la carpeta si no existe
if not exist C:\Forti (
    mkdir C:\Forti >nul 2>&1
    echo [%date% %time%] Creada la carpeta C:\Forti >> %LOG_FILE%
) else (
    echo [%date% %time%] La carpeta C:\Forti ya existe. >> %LOG_FILE%
)

:: Descargar los archivos si no existen
echo [%date% %time%] Comenzando a descargar los instaladores... >> %LOG_FILE%

:: Firefox
if not exist C:\Forti\firefox.exe (
    curl -L -o C:\Forti\firefox.exe "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=es-ES" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo [%date% %time%] Firefox descargado correctamente. >> %LOG_FILE%
    ) else (
        echo [%date% %time%] Error al descargar Firefox. >> %LOG_FILE%
    )
) else (
    echo [%date% %time%] Firefox ya está descargado. >> %LOG_FILE%
)

:: 7-Zip
if not exist C:\Forti\7zip_installer.exe (
    curl -L -o C:\Forti\7zip_installer.exe "https://www.7-zip.org/a/7z2301-x64.exe" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo [%date% %time%] 7-Zip descargado correctamente. >> %LOG_FILE%
    ) else (
        echo [%date% %time%] Error al descargar 7-Zip. >> %LOG_FILE%
    )
) else (
    echo [%date% %time%] 7-Zip ya está descargado. >> %LOG_FILE%
)

:: AnyDesk
if not exist C:\Forti\anydesk_installer.exe (
    curl -L -o C:\Forti\anydesk_installer.exe "https://download.anydesk.com/AnyDesk.exe" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo [%date% %time%] AnyDesk descargado correctamente. >> %LOG_FILE%
    ) else (
        echo [%date% %time%] Error al descargar AnyDesk. >> %LOG_FILE%
    )
) else (
    echo [%date% %time%] AnyDesk ya está descargado. >> %LOG_FILE%
)

:: Chrome
if not exist C:\Forti\chrome_installer.exe (
    curl -L -o C:\Forti\chrome_installer.exe "https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo [%date% %time%] Chrome descargado correctamente. >> %LOG_FILE%
    ) else (
        echo [%date% %time%] Error al descargar Chrome. >> %LOG_FILE%
    )
) else (
    echo [%date% %time%] Chrome ya está descargado. >> %LOG_FILE%
)

:: FortiClient VPN
if not exist C:\Forti\FortiClientVPNOnlineInstaller.exe (
    curl -L -o C:\Forti\FortiClientVPNOnlineInstaller.exe "https://raw.githubusercontent.com/Despligue80/desplieges/main/tanium/FortiClientVPNOnlineInstaller.exe" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo [%date% %time%] FortiClient VPN descargado correctamente. >> %LOG_FILE%
    ) else (
        echo [%date% %time%] Error al descargar FortiClient VPN. >> %LOG_FILE%
    )
) else (
    echo [%date% %time%] FortiClient VPN ya está descargado. >> %LOG_FILE%
)

:: Instalaciones Silenciosas
echo [%date% %time%] Comenzando la instalación de las aplicaciones... >> %LOG_FILE%

:: Instalar Firefox
start /wait C:\Forti\firefox.exe -ms >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] Instalación de Firefox completada. >> %LOG_FILE%
) else (
    echo [%date% %time%] Error al instalar Firefox. >> %LOG_FILE%
)

:: Instalar 7-Zip
start /wait C:\Forti\7zip_installer.exe /S >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] Instalación de 7-Zip completada. >> %LOG_FILE%
) else (
    echo [%date% %time%] Error al instalar 7-Zip. >> %LOG_FILE%
)

:: Instalar AnyDesk
start /wait C:\Forti\anydesk_installer.exe /S >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] Instalación de AnyDesk completada. >> %LOG_FILE%
) else (
    echo [%date% %time%] Error al instalar AnyDesk. >> %LOG_FILE%
)

:: Instalar Chrome
start /wait msiexec /i C:\Forti\chrome_installer.exe /quiet /norestart >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] Instalación de Chrome completada. >> %LOG_FILE%
) else (
    echo [%date% %time%] Error al instalar Chrome. >> %LOG_FILE%
)

:: Instalar FortiClient VPN
start /wait C:\Forti\FortiClientVPNOnlineInstaller.exe /quiet /norestart >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] Instalación de FortiClient VPN completada. >> %LOG_FILE%
) else (
    echo [%date% %time%] Error al instalar FortiClient VPN. >> %LOG_FILE%
)

:: Finalización
echo [%date% %time%] Script completado. >> %LOG_FILE%
pause
