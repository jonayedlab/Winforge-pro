@echo off
setlocal
title WinForge Pro v1.0 - Jonayed Lab
color 0B
mode con: cols=78 lines=42

:: ================================================================
::  ADMIN PRIVILEGE CHECK
:: ================================================================
>nul 2>&1 net session
if %errorlevel% neq 0 (
    cls
    color 0E
    echo.
    echo  ==========================================================
    echo     [!] WinForge Pro requires Administrator privileges.
    echo     [!] Requesting elevation via UAC...
    echo  ==========================================================
    echo.
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\_wfp_elevate.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\_wfp_elevate.vbs"
    "%temp%\_wfp_elevate.vbs"
    exit /B
)
if exist "%temp%\_wfp_elevate.vbs" del "%temp%\_wfp_elevate.vbs"
pushd "%~dp0"


:: ================================================================
::                        MAIN MENU
:: ================================================================
:main_menu
cls
color 0B
echo.
echo  ==========================================================
echo  :                                                        :
echo  :   ##   ##  ##  ##  ##  #####  ####  ####   ###  #####  :
echo  :   ##   ##  ##  ### ##  ##    ##  ## ## ## ##    ##      :
echo  :   ## # ##  ##  ## ###  ###   ##  ## ####  ## ## ###     :
echo  :   #######  ##  ##  ##  ##    ##  ## ## ## ##  # ##      :
echo  :    ## ##   ##  ##  ##  ##     ####  ##  #  ###  #####   :
echo  :                                                        :
echo  :               P   R   O     v 1 . 0                    :
echo  :                                                        :
echo  :       Advanced Windows Optimization Suite               :
echo  :          A Product of Jonayed Lab                       :
echo  :                                                        :
echo  :========================================================:
echo  :                                                        :
echo  :   [1]  Search ^& Cortana Manager                       :
echo  :   [2]  Privacy ^& UI Tweaks                            :
echo  :   [3]  Lock Screen Manager                             :
echo  :   [4]  Startup Apps Manager                            :
echo  :   [5]  Windows Update Manager                          :
echo  :   [6]  Quick Optimize  (All Recommended Tweaks)        :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [A]  About WinForge Pro                              :
echo  :   [0]  Exit                                            :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "mchoice=   Select Module [0-6 / A]: "

if "%mchoice%"=="1" goto menu_search
if "%mchoice%"=="2" goto menu_privacy
if "%mchoice%"=="3" goto menu_lockscreen
if "%mchoice%"=="4" goto menu_startup
if "%mchoice%"=="5" goto menu_winupdate
if "%mchoice%"=="6" goto quick_optimize
if /i "%mchoice%"=="A" goto about
if "%mchoice%"=="a" goto about
if "%mchoice%"=="0" goto exit_app

echo.
echo   [!] Invalid selection. Try again.
timeout /t 2 >nul
goto main_menu


:: ================================================================
::           MODULE 1: SEARCH ^& CORTANA MANAGER
:: ================================================================
:menu_search
cls
color 0E
echo.
echo  ==========================================================
echo  :         MODULE 1 : SEARCH ^& CORTANA MANAGER            :
echo  :========================================================:
echo  :                                                        :
echo  :   [1]  Disable Web Search + Highlights + Cloud         :
echo  :   [2]  Enable  Web Search + Highlights + Cloud         :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [3]  Disable Web + Cloud Search  (Legacy/Cortana)    :
echo  :   [4]  Enable  Web + Cloud Search  (Legacy/Cortana)    :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [0]  Back to Main Menu                               :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "sc=   Select Option [0-4]: "

if "%sc%"=="1" goto s_dis_hl
if "%sc%"=="2" goto s_en_hl
if "%sc%"=="3" goto s_dis_wc
if "%sc%"=="4" goto s_en_wc
if "%sc%"=="0" goto main_menu

echo   [!] Invalid option.
timeout /t 2 >nul
goto menu_search

:: --- Disable Web Search + Highlights ---
:s_dis_hl
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Web Search, Highlights ^& Cloud Suggestions  :
echo  ==========================================================
echo.
echo   [*] Disabling search box suggestions...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Disabling dynamic search box...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDynamicSearchBoxEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling search box auto-expand...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsSearchBoxTaskbarAutoExpanded /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling cloud search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchOnCloud /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchCloudExperience /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [*] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 >nul
start explorer.exe
echo.
echo   [OK] Web Search, Highlights ^& Cloud Suggestions DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_search

:: --- Enable Web Search + Highlights ---
:s_en_hl
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Web Search, Highlights ^& Cloud Suggestions   :
echo  ==========================================================
echo.
echo   [*] Removing search box restriction policy...
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /f >nul 2>&1
echo   [*] Enabling dynamic search box...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDynamicSearchBoxEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling search box auto-expand...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsSearchBoxTaskbarAutoExpanded /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling cloud search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchOnCloud /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchCloudExperience /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [*] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 >nul
start explorer.exe
echo.
echo   [OK] Web Search, Highlights ^& Cloud Suggestions ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_search

:: --- Disable Legacy Web + Cloud Search ---
:s_dis_wc
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Web ^& Cloud Search (Legacy / Cortana)       :
echo  ==========================================================
echo.
echo   [*] Disabling search box suggestions...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Disabling Bing search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling location-based search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Revoking Cortana consent...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling cloud search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchOnCloud /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchCloudExperience /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [OK] Web ^& Cloud Search (Legacy) DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_search

:: --- Enable Legacy Web + Cloud Search ---
:s_en_wc
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Web ^& Cloud Search (Legacy / Cortana)        :
echo  ==========================================================
echo.
echo   [*] Removing search box restriction...
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /f >nul 2>&1
echo   [*] Enabling Bing search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling location-based search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Granting Cortana consent...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling cloud search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchOnCloud /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchCloudExperience /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [OK] Web ^& Cloud Search (Legacy) ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_search


:: ================================================================
::            MODULE 2: PRIVACY ^& UI TWEAKS
:: ================================================================
:menu_privacy
cls
color 0D
echo.
echo  ==========================================================
echo  :           MODULE 2 : PRIVACY ^& UI TWEAKS               :
echo  :========================================================:
echo  :                                                        :
echo  :   [1]  Disable Recent Files  (Quick Access)            :
echo  :   [2]  Enable  Recent Files  (Quick Access)            :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [3]  Disable Windows Tips ^& Notifications           :
echo  :   [4]  Enable  Windows Tips ^& Notifications           :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [0]  Back to Main Menu                               :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "pc=   Select Option [0-4]: "

if "%pc%"=="1" goto p_dis_rec
if "%pc%"=="2" goto p_en_rec
if "%pc%"=="3" goto p_dis_tip
if "%pc%"=="4" goto p_en_tip
if "%pc%"=="0" goto main_menu

echo   [!] Invalid option.
timeout /t 2 >nul
goto menu_privacy

:: --- Disable Recent Files ---
:p_dis_rec
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Recent Files in Quick Access                 :
echo  ==========================================================
echo.
echo   [*] Hiding recent files...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Hiding frequent folders...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [OK] Recent Files DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_privacy

:: --- Enable Recent Files ---
:p_en_rec
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Recent Files in Quick Access                  :
echo  ==========================================================
echo.
echo   [*] Showing recent files...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Showing frequent folders...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [OK] Recent Files ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_privacy

:: --- Disable Windows Tips ---
:p_dis_tip
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Windows Tips ^& Notifications                :
echo  ==========================================================
echo.
echo   [*] Disabling tips content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling toast notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [OK] Windows Tips ^& Notifications DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_privacy

:: --- Enable Windows Tips ---
:p_en_tip
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Windows Tips ^& Notifications                 :
echo  ==========================================================
echo.
echo   [*] Enabling tips content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling toast notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [OK] Windows Tips ^& Notifications ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_privacy


:: ================================================================
::            MODULE 3: LOCK SCREEN MANAGER
:: ================================================================
:menu_lockscreen
cls
color 03
echo.
echo  ==========================================================
echo  :          MODULE 3 : LOCK SCREEN MANAGER                 :
echo  :========================================================:
echo  :                                                        :
echo  :   [1]  Disable Lock Screen Fun Facts                   :
echo  :   [2]  Enable  Lock Screen Fun Facts                   :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [3]  Disable Lock Screen Info  (Only Time Visible)   :
echo  :   [4]  Enable  Lock Screen Info  (Spotlight, Tips)     :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [0]  Back to Main Menu                               :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "lc=   Select Option [0-4]: "

if "%lc%"=="1" goto l_dis_fun
if "%lc%"=="2" goto l_en_fun
if "%lc%"=="3" goto l_dis_info
if "%lc%"=="4" goto l_en_info
if "%lc%"=="0" goto main_menu

echo   [!] Invalid option.
timeout /t 2 >nul
goto menu_lockscreen

:: --- Disable Fun Facts ---
:l_dis_fun
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Lock Screen Fun Facts                        :
echo  ==========================================================
echo.
echo   [*] Disabling fun facts content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [OK] Lock Screen Fun Facts DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_lockscreen

:: --- Enable Fun Facts ---
:l_en_fun
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Lock Screen Fun Facts                         :
echo  ==========================================================
echo.
echo   [*] Enabling fun facts content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [OK] Lock Screen Fun Facts ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_lockscreen

:: --- Disable Lock Screen Info ---
:l_dis_info
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Lock Screen Info, Tips ^& Spotlight          :
echo  ==========================================================
echo.
echo   [*] Disabling rotating lock screen...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling overlay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling subscribed content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   [*] Disabling notifications above lock screen...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   [OK] Lock Screen Info, Tips ^& Spotlight DISABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_lockscreen

:: --- Enable Lock Screen Info ---
:l_en_info
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Lock Screen Info, Tips ^& Spotlight           :
echo  ==========================================================
echo.
echo   [*] Enabling rotating lock screen...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling overlay...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling subscribed content...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   [*] Enabling notifications above lock screen...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   [OK] Lock Screen Info, Tips ^& Spotlight ENABLED.
echo.
echo   Press any key to go back...
pause >nul
goto menu_lockscreen


:: ================================================================
::            MODULE 4: STARTUP APPS MANAGER
:: ================================================================
:menu_startup
cls
color 06
echo.
echo  ==========================================================
echo  :         MODULE 4 : STARTUP APPS MANAGER                 :
echo  :========================================================:
echo  :                                                        :
echo  :   [1]  Disable Startup  (OneDrive, Teams, Skype)       :
echo  :   [2]  Enable  Startup  (Smart App Detection)          :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [3]  View Current Startup Entries                    :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [0]  Back to Main Menu                               :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "stc=   Select Option [0-3]: "

if "%stc%"=="1" goto st_dis
if "%stc%"=="2" goto st_en
if "%stc%"=="3" goto st_view
if "%stc%"=="0" goto main_menu

echo   [!] Invalid option.
timeout /t 2 >nul
goto menu_startup

:: --- Disable Startup Apps ---
:st_dis
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Common Startup Applications                  :
echo  ==========================================================
echo.
echo   [*] Removing OneDrive...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f >nul 2>&1
if %errorlevel% equ 0 (echo   [OK] OneDrive removed.) else (echo   [--] OneDrive not in startup.)

echo   [*] Removing Microsoft Teams...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams /f >nul 2>&1
if %errorlevel% equ 0 (echo   [OK] Teams removed.) else (echo   [--] Teams not in startup.)

echo   [*] Removing Skype...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Skype /f >nul 2>&1
if %errorlevel% equ 0 (echo   [OK] Skype removed.) else (echo   [--] Skype not in startup.)

echo.
echo   [OK] Startup cleanup complete.
echo.
echo   Press any key to go back...
pause >nul
goto menu_startup

:: --- Enable Startup Apps ---
:st_en
cls
color 0A
echo.
echo  ==========================================================
echo  :  Restoring Startup Apps  (Smart Detection)              :
echo  ==========================================================
echo.
echo   [*] Scanning for installed applications...
echo.

if exist "%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "\"%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe\" /background" /f >nul 2>&1
    echo   [OK] OneDrive found - startup entry restored.
) else (
    echo   [--] OneDrive not installed - skipped.
)

if exist "%LOCALAPPDATA%\Microsoft\Teams\Update.exe" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams /t REG_SZ /d "\"%LOCALAPPDATA%\Microsoft\Teams\Update.exe\" --processStart \"Teams.exe\"" /f >nul 2>&1
    echo   [OK] Teams found - startup entry restored.
) else (
    echo   [--] Microsoft Teams not installed - skipped.
)

if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Skype\Skype.lnk" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Skype /t REG_SZ /d "\"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Skype\Skype.lnk\"" /f >nul 2>&1
    echo   [OK] Skype found - startup entry restored.
) else (
    echo   [--] Skype not installed - skipped.
)

echo.
echo   [OK] Smart startup restore complete.
echo.
echo   Press any key to go back...
pause >nul
goto menu_startup

:: --- View Startup Entries ---
:st_view
cls
color 0B
echo.
echo  ==========================================================
echo  :  Current User Startup Entries                           :
echo  ==========================================================
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2>nul
if %errorlevel% neq 0 echo   [--] No startup entries found.
echo.
echo  ==========================================================
echo.
echo   Press any key to go back...
pause >nul
goto menu_startup


:: ================================================================
::           MODULE 5: WINDOWS UPDATE MANAGER
:: ================================================================
:menu_winupdate
cls
color 1F

:: Detect current status
set "WU_LABEL=  UNKNOWN  "
(reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" 2>nul | find /i "0x1")>nul 2>nul
if %errorlevel% equ 0 (
    set "WU_LABEL=   OFF   "
) else (
    set "WU_LABEL=    ON   "
)

echo.
echo  ==========================================================
echo  :        MODULE 5 : WINDOWS UPDATE MANAGER                :
echo  :========================================================:
echo  :                                                        :
echo  :   Auto Updates Status:  [ %WU_LABEL% ]                 :
echo  :                                                        :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :                                                        :
echo  :   [1]  Disable Windows Automatic Updates               :
echo  :   [2]  Enable  Windows Automatic Updates               :
echo  :   [3]  View Detailed Status Report                     :
echo  :   - - - - - - - - - - - - - - - - - - - - - - - - - -  :
echo  :   [0]  Back to Main Menu                               :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "wuc=   Select Option [0-3]: "

if "%wuc%"=="1" goto wu_dis
if "%wuc%"=="2" goto wu_en
if "%wuc%"=="3" goto wu_stat
if "%wuc%"=="0" goto main_menu

echo   [!] Invalid option.
timeout /t 2 >nul
goto menu_winupdate

:: --- Disable Auto Updates ---
:wu_dis
cls
color 0C
echo.
echo  ==========================================================
echo  :  Disabling Windows Automatic Updates                    :
echo  ==========================================================
echo.
echo   [*] Stopping Windows Update service...
net stop wuauserv >nul 2>&1

set "WU_ERR=0"

echo   [*] Setting NoAutoUpdate = 1 ...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /D "1" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo   [*] Setting AUOptions = 2  (notify only)...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /D "2" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo   [*] Blocking OS upgrades...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /D "1" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo.
IF "%WU_ERR%"=="1" (
    echo   [!!] ERROR: Some changes failed. Ensure admin rights.
) else (
    echo   [OK] Windows Automatic Updates DISABLED.
    echo   [OK] OS Upgrade blocking is now ACTIVE.
)
echo.
echo   Press any key to go back...
pause >nul
goto menu_winupdate

:: --- Enable Auto Updates ---
:wu_en
cls
color 0A
echo.
echo  ==========================================================
echo  :  Enabling Windows Automatic Updates                     :
echo  ==========================================================
echo.
echo   [*] Stopping update service temporarily...
net stop wuauserv >nul 2>&1

set "WU_ERR=0"

echo   [*] Setting NoAutoUpdate = 0 ...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /D "0" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo   [*] Setting AUOptions = 4  (auto-install)...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /D "4" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo   [*] Removing OS upgrade block...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /D "0" /T REG_DWORD /F >nul 2>&1
IF %ERRORLEVEL% NEQ 0 set "WU_ERR=1"

echo   [*] Restarting update service...
net start wuauserv >nul 2>&1

echo.
IF "%WU_ERR%"=="1" (
    echo   [!!] ERROR: Some changes failed. Ensure admin rights.
) else (
    echo   [OK] Windows Automatic Updates ENABLED.
    echo   [OK] Update service restarted successfully.
)
echo.
echo   Press any key to go back...
pause >nul
goto menu_winupdate

:: --- View Status Report ---
:wu_stat
cls
color 0B
echo.
echo  ==========================================================
echo  :  Windows Update - Status Report                         :
echo  ==========================================================
echo.
echo   --- Registry: NoAutoUpdate ---
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" 2>nul
if %errorlevel% neq 0 echo   [--] Key not found (default: updates enabled)
echo.
echo   --- Registry: AUOptions ---
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" 2>nul
if %errorlevel% neq 0 echo   [--] Key not found
echo.
echo   --- Registry: DisableOSUpgrade ---
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" 2>nul
if %errorlevel% neq 0 echo   [--] Key not found (default: upgrades allowed)
echo.
echo   --- Service: wuauserv ---
sc query wuauserv 2>nul | findstr /i "STATE"
if %errorlevel% neq 0 echo   [--] Could not query service
echo.
echo  ==========================================================
echo.
echo   Press any key to go back...
pause >nul
goto menu_winupdate


:: ================================================================
::           MODULE 6: QUICK OPTIMIZE
:: ================================================================
:quick_optimize
cls
color 0E
echo.
echo  ==========================================================
echo  :              QUICK OPTIMIZE MODE                        :
echo  :========================================================:
echo  :                                                        :
echo  :  Applies ALL recommended tweaks in one click:          :
echo  :                                                        :
echo  :   [x] Disable Web Search ^& Bing Highlights            :
echo  :   [x] Disable Cloud Search ^& Cortana                  :
echo  :   [x] Disable Recent Files in Quick Access             :
echo  :   [x] Disable Windows Tips ^& Notifications            :
echo  :   [x] Disable Lock Screen Fun Facts                    :
echo  :   [x] Disable Lock Screen Spotlight ^& Tips            :
echo  :   [x] Remove Startup Bloat (OneDrive/Teams/Skype)     :
echo  :                                                        :
echo  :  NOTE: Windows Update is NOT changed here.             :
echo  :        Use Module 5 for update control.                :
echo  :                                                        :
echo  ==========================================================
echo.

set /p "qc=   Apply all 7 optimizations? [Y/N]: "
if /i not "%qc%"=="Y" goto main_menu

cls
color 0E
echo.
echo  ==========================================================
echo  :           APPLYING ALL OPTIMIZATIONS...                 :
echo  ==========================================================
echo.

echo   [1/7] Disabling Web Search ^& Highlights...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDynamicSearchBoxEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsSearchBoxTaskbarAutoExpanded /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchOnCloud /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SearchCloudExperience /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [2/7] Disabling Legacy Cloud Search ^& Cortana...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchOnCloud /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchCloudExperience /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [3/7] Disabling Recent Files in Quick Access...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [4/7] Disabling Windows Tips ^& Notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [5/7] Disabling Lock Screen Fun Facts...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [6/7] Disabling Lock Screen Info ^& Spotlight...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /t REG_DWORD /d 0 /f >nul 2>&1
echo         Done.

echo   [7/7] Removing Startup Bloat...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v com.squirrel.Teams.Teams /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Skype /f >nul 2>&1
echo         Done.

echo.
echo   [*] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 >nul
start explorer.exe

echo.
echo  ==========================================================
echo  :                                                        :
echo  :   ALL 7 OPTIMIZATIONS APPLIED SUCCESSFULLY!            :
echo  :                                                        :
echo  :   TIP: Restart your PC for full effect.                :
echo  :                                                        :
echo  ==========================================================
echo.
echo   Press any key to return to Main Menu...
pause >nul
goto main_menu


:: ================================================================
::                     ABOUT SCREEN
:: ================================================================
:about
cls
color 0B
echo.
echo  ==========================================================
echo  :                                                        :
echo  :   ##   ##  ##  ##  ##  #####  ####  ####   ###  #####  :
echo  :   ##   ##  ##  ### ##  ##    ##  ## ## ## ##    ##      :
echo  :   ## # ##  ##  ## ###  ###   ##  ## ####  ## ## ###     :
echo  :   #######  ##  ##  ##  ##    ##  ## ## ## ##  # ##      :
echo  :    ## ##   ##  ##  ##  ##     ####  ##  #  ###  #####   :
echo  :                                                        :
echo  :               P   R   O     v 1 . 0                    :
echo  :                                                        :
echo  :========================================================:
echo  :                                                        :
echo  :   Version       :  1.0.0 (Stable)                      :
echo  :   Author        :  Jonayed                              :
echo  :   Organization  :  Jonayed Lab                          :
echo  :   Platform      :  Windows 10 / 11                      :
echo  :   License       :  MIT License                          :
echo  :                                                        :
echo  :========================================================:
echo  :                                                        :
echo  :   MODULES INCLUDED:                                    :
echo  :                                                        :
echo  :   [1] Search ^& Cortana Manager                        :
echo  :       Web search, highlights, Bing, Cortana,           :
echo  :       cloud suggestions, location search               :
echo  :                                                        :
echo  :   [2] Privacy ^& UI Tweaks                             :
echo  :       Recent files, frequent folders,                  :
echo  :       tips, toast notifications                        :
echo  :                                                        :
echo  :   [3] Lock Screen Manager                              :
echo  :       Fun facts, Spotlight, rotating images,           :
echo  :       overlays, lock screen notifications              :
echo  :                                                        :
echo  :   [4] Startup Apps Manager                             :
echo  :       OneDrive, Teams, Skype with smart                :
echo  :       detection + startup entry viewer                 :
echo  :                                                        :
echo  :   [5] Windows Update Manager                           :
echo  :       Auto-update toggle, OS upgrade policy,           :
echo  :       service control, live status report              :
echo  :                                                        :
echo  :   [6] Quick Optimize                                   :
echo  :       One-click apply all 7 recommended tweaks         :
echo  :                                                        :
echo  :========================================================:
echo  :                                                        :
echo  :    Crafted with care by Jonayed Lab                    :
echo  :    "Optimize your Windows, your way."                  :
echo  :                                                        :
echo  ==========================================================
echo.
echo   Press any key to return to Main Menu...
pause >nul
goto main_menu


:: ================================================================
::                        EXIT
:: ================================================================
:exit_app
cls
color 0B
echo.
echo.
echo  ==========================================================
echo  :                                                        :
echo  :   Thank you for using WinForge Pro!                    :
echo  :                                                        :
echo  :   A Product of Jonayed Lab                             :
echo  :   Developed by Jonayed                                 :
echo  :                                                        :
echo  :   "Optimize your Windows, your way."                   :
echo  :                                                        :
echo  ==========================================================
echo.
echo.
timeout /t 3 >nul
endlocal
exit
