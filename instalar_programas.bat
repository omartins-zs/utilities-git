@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title Instalacao de Programas via Winget
color 0A

set SUCESSO=0
set FALHA=0

set OPCOES=--silent --accept-package-agreements --accept-source-agreements

echo ============================================================
echo          INICIANDO PROCESSO DE INSTALAÇÃO VIA WINGET
echo ============================================================
echo.

:: ---------------------------------------------------------
:: 1. INSTALAÇÃO / VERIFICAÇÃO DO WINGET
:: ---------------------------------------------------------
echo ============================================================
echo [Etapa 1] Verificando / Instalando Winget...
echo ============================================================
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget nao encontrado no sistema. Baixando e instalando...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' -OutFile '%temp%\winget.msixbundle'; Add-AppxPackage -Path '%temp%\winget.msixbundle'"
)
echo ja instalou o winget
echo.

:: ---------------------------------------------------------
:: 2. INSTALAÇÃO DO WINDOWS TERMINAL
:: ---------------------------------------------------------
echo ============================================================
echo [Etapa 2] Instalando Windows Terminal...
echo ============================================================
winget install --id Microsoft.WindowsTerminal %OPCOES%
if !errorlevel! equ 0 (
    echo [OK] Windows Terminal instalado com sucesso.
    set /a SUCESSO+=1
) else (
    echo [X] Falha ou programa ja instalado: Windows Terminal.
    set /a FALHA+=1
)
echo ja instalou o windows terminal
echo.

:: ---------------------------------------------------------
:: 3. INSTALAÇÃO DOS DEMAIS PROGRAMAS
:: ---------------------------------------------------------
echo ============================================================
echo [Etapa 3] Instalando os demais programas...
echo ============================================================
echo.

:: QuickLook
echo [1/20] Instalando QuickLook...
winget install --id Paddles.QuickLook %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Notepads App
echo [2/20] Instalando Notepads App...
winget install --id 83416F6F.NotepadsApp %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Everything
echo [3/20] Instalando Everything...
winget install --id voidtools.Everything %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Microsoft Edge
echo [4/20] Instalando Microsoft Edge...
winget install --id Microsoft.Edge %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Microsoft Teams
echo [5/20] Instalando Microsoft Teams...
winget install --id Microsoft.Teams %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: SSMS (Versão específica: 18.12.1)
echo [6/20] Instalando SSMS (Versao especifica 18.12.1)...
winget install --id Microsoft.SQLServerManagementStudio --version 18.12.1 %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: HeidiSQL
echo [7/20] Instalando HeidiSQL...
winget install --id HeidiSQL.HeidiSQL %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Laragon (Versão específica: 6.0.0)
echo [8/20] Instalando Laragon (Versao especifica 6.0.0)...
winget install --id leokho.laragon --version 6.0.0 %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: WinRAR
echo [9/20] Instalando WinRAR...
winget install --id RARLab.WinRAR %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: 7-Zip
echo [10/20] Instalando 7-Zip...
winget install --id 7zip.7zip %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Unlocker
echo [11/20] Instalando IObit Unlocker...
winget install --id Iobit.Unlocker %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Google Antigravity
echo [12/20] Instalando Antigravity...
winget install --id Google.Antigravity %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Visual Studio Code
echo [13/20] Instalando Visual Studio Code...
winget install --id Microsoft.VisualStudioCode %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Claude
echo [14/20] Instalando Claude...
winget install --id Anthropic.Claude %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Tailscale
echo [15/20] Instalando Tailscale...
winget install --id Tailscale.Tailscale %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Google Chrome
echo [16/20] Instalando Google Chrome...
winget install --id Google.Chrome %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Docker Desktop
echo [17/20] Instalando Docker Desktop...
winget install --id Docker.DockerDesktop %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Git
echo [18/20] Instalando Git...
winget install --id Git.Git %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: Node.js
echo [19/20] Instalando Node.js...
winget install --id OpenJS.NodeJS %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: GitHub CLI (gh)
echo [20/20] Instalando GitHub CLI (gh)...
winget install --id GitHub.cli %OPCOES%
if !errorlevel! equ 0 ( set /a SUCESSO+=1 ) else ( set /a FALHA+=1 )
echo.

:: ---------------------------------------------------------
:: RELATÓRIO FINAL
:: ---------------------------------------------------------
echo ============================================================
echo                    RESUMO DA INSTALAÇÃO
echo ============================================================
echo Programas instalados com sucesso: !SUCESSO!
echo Programas com falha / ja instalados: !FALHA!
echo ============================================================
echo.
pause