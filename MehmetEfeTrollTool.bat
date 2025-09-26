@echo off
title Efee! - Initializing...
color 0A

echo ========================================
echo     Builder Starting...
echo ========================================
timeout /t 2 /nobreak >nul

REM 1. Fare imlecini değiştir (bekleme imleci)
echo [1/25] Optimizing cursor settings...
reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "%SystemRoot%\cursors\wait_r.cur" /f >nul 2>&1
reg add "HKCU\Control Panel\Cursors" /v Hand /t REG_EXPAND_SZ /d "%SystemRoot%\cursors\wait_r.cur" /f >nul 2>&1
reg add "HKCU\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /d "%SystemRoot%\cursors\wait_r.cur" /f >nul 2>&1
reg add "HKCU\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /d "%SystemRoot%\cursors\wait_r.cur" /f >nul 2>&1
rundll32.exe user32.dll,UpdatePerUserSystemParameters
timeout /t 1 /nobreak >nul

REM 2. Masaüstü duvar kağıdını değiştir (geçici)
echo [2/25] Updating desktop configuration...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "255 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "0" /f >nul 2>&1
rundll32.exe user32.dll,UpdatePerUserSystemParameters
gpupdate /force >nul 2>&1
timeout /t 2 /nobreak >nul

REM 3. Ekran koruyucuyu aktifleştir
echo [3/25] Configuring screen saver...
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d "1" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d "60" /f >nul 2>&1
timeout /t 1 /nobreak >nul

REM 4. Görev çubuğunu gizle
echo [4/25] Optimizing taskbar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /t REG_BINARY /d "30000000feffffff7af400000300000030000000300000000000000000040000800700001a040000" /f >nul 2>&1
timeout /t 1 /nobreak >nul

REM 5. Ses seviyesini değiştir
echo [5/25] Adjusting audio levels...
nircmd.exe setsysvolume 65535 >nul 2>&1
timeout /t 1 /nobreak >nul

REM 6. Caps Lock'u aktifleştir
echo [6/25] Configuring keyboard settings...
nircmd.exe sendkeypress capslock >nul 2>&1
timeout /t 1 /nobreak >nul

REM 7. Çok sayıda notepad aç
echo [7/25] Loading text editors...
for /l %%i in (1,1,10) do (
    start notepad.exe
    timeout /t 0.2 /nobreak >nul
)

REM 8. Hesap makinesi aç
echo [8/25] Starting calculator modules...
for /l %%i in (1,1,5) do (
    start calc.exe
    timeout /t 0.3 /nobreak >nul
)

REM 9. Paint aç
echo [9/25] Initializing graphics modules...
for /l %%i in (1,1,3) do (
    start mspaint.exe
    timeout /t 0.5 /nobreak >nul
)

REM 10. Komut istemi pencereleri aç
echo [10/25] Starting system terminals...
for /l %%i in (1,1,8) do (
    start cmd.exe /k "echo FavianCore Terminal %%i && echo System Status: ACTIVE"
    timeout /t 0.3 /nobreak >nul
)

REM 11. Sistem bilgilerini göster
echo [11/25] Displaying system information...
start msinfo32.exe
timeout /t 1 /nobreak >nul

REM 12. Görev yöneticisini aç
echo [12/25] Opening task manager...
start taskmgr.exe
timeout /t 1 /nobreak >nul

REM 13. Kontrol panelini aç
echo [13/25] Loading control panel...
start control.exe
timeout /t 1 /nobreak >nul

REM 14. Chrome tarayıcılarını YouTube ile aç
echo [14/25] Starting Chrome browsers...
for /l %%i in (1,1,8) do (
    start chrome.exe "https://www.youtube.com/watch?v=aebBnk0nzbU"
    timeout /t 0.5 /nobreak >nul
)

REM 15. Dosya gezginini aç
echo [15/25] Starting file explorers...
for /l %%i in (1,1,3) do (
    start explorer.exe
    timeout /t 0.4 /nobreak >nul
)

REM 16. Çöp kutusunu aç
echo [16/25] Accessing recycle bin...
start shell:RecycleBinFolder
timeout /t 1 /nobreak >nul

REM 17. Sistem seslerini çal
echo [17/25] Playing system sounds...
start /min wmplayer.exe "%SystemRoot%\Media\Windows Startup.wav" >nul 2>&1
timeout /t 2 /nobreak >nul

REM 18. Ekran çözünürlüğünü geçici değiştir
echo [18/25] Adjusting display settings...
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Screen]::AllScreens | ForEach-Object { $_.Bounds }" >nul 2>&1
powershell -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Win32 { [DllImport(\"user32.dll\")] public static extern int ChangeDisplaySettings(IntPtr devMode, int flags); }'; [Win32]::ChangeDisplaySettings([IntPtr]::Zero, 0)" >nul 2>&1
timeout /t 2 /nobreak >nul
echo Display resolution temporarily adjusted...
timeout /t 1 /nobreak >nul

REM 19. Saat ve tarih ayarlarını aç
echo [19/25] Opening time settings...
start timedate.cpl
timeout /t 1 /nobreak >nul

REM 20. Ağ bağlantılarını göster
echo [20/25] Displaying network connections...
start ncpa.cpl
timeout /t 1 /nobreak >nul

REM 21. Sistem özelliklerini aç
echo [21/25] Loading system properties...
start sysdm.cpl
timeout /t 1 /nobreak >nul

REM 22. Cihaz yöneticisini aç
echo [22/25] Starting device manager...
start devmgmt.msc
timeout /t 1 /nobreak >nul

REM 23. Olay görüntüleyicisini aç
echo [23/25] Opening event viewer...
start eventvwr.msc
timeout /t 1 /nobreak >nul

REM 24. Kayıt defteri düzenleyicisini aç
echo [24/25] Loading registry editor...
start regedit.exe
timeout /t 1 /nobreak >nul

REM 25. Performans izleyicisini aç
echo [25/25] Starting performance monitor...
start perfmon.exe
timeout /t 1 /nobreak >nul

REM 26. Eğlenceli mesaj kutuları göster
echo [26/26] Finalizing FavianCore installation...
msg * "Troll.bat Successfully Installed!"
timeout /t 2 /nobreak >nul
msg * "System Optimization Complete!"
timeout /t 2 /nobreak >nul
msg * "Your computer is now running FavianCore V2!"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo    Installation Complete!
echo    System Status: OPTIMIZED
echo    Performance: ENHANCED
echo    Security: MAXIMUM
echo ========================================
echo.
echo Press any key to activate TURBO MODE...
pause >nul

REM Bonus: Turbo Mode (daha fazla eğlence)
color 0C
echo.
echo *** TURBO MODE ACTIVATED ***
echo System running at 150%% capacity!
echo.

REM Daha fazla notepad aç
for /l %%i in (1,1,15) do (
    start notepad.exe
    timeout /t 0.1 /nobreak >nul
)

echo.
echo 
echo.
echo (To restore normal settings, simply restart your computer)
pause

REM Temizlik scripti oluştur
echo @echo off > "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo title FavianCore Restore Tool >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo echo Restoring original settings... >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_arrow.cur" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Cursors" /v Hand /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_link.cur" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_helpsel.cur" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\beam_r.cur" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo rundll32.exe user32.dll,UpdatePerUserSystemParameters >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 78 152" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d "0" /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo taskkill /f /im notepad.exe ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo taskkill /f /im calc.exe ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo taskkill /f /im mspaint.exe ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo echo Settings restored! Please restart your computer. >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"
echo pause >> "%USERPROFILE%\Desktop\RestoreFavianCore.bat"

echo.
echo Restore script created on desktop: RestoreFavianCore.bat
echo.
