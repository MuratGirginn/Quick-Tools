@echo off
chcp 65001
cls


color 09

:: Titles
echo -----------------------------------------------------
echo    Murat Girgin - Hızlı Çözüm Araçları
echo -----------------------------------------------------

:MENU
echo 1. Grup Politikalarını Güncelle (gpupdate /force)
echo 2. IP Göster
echo 3. Windows Lisans Göster
echo 4. Nbtstat  Göster
echo 5. Wi-Fi Şifresini Göster
echo 6. Son Format Tarihini Göster
echo 7. Disk Durumunu Kontrol Et
echo 8. Windows Güncelleme Durumunu Göster
echo 9. CPU Bilgilerini Göster
echo 10. Bellek (RAM) Kullanımını Göster
echo 11. Bilgisayar Seri Numarasını, Adını, Marka ve Modelini Göster
echo 12. Kullanıcı Hesaplarını Listele
echo 13. Depolama Alanı Durumunu Göster
echo 14. Sabit Diski Tarama
echo 15. Windows Store Uygulamalarını Güncelle
echo 16. Network DNS Önbelleğini Temizle
echo 17. Windows Sistem Dosyalarını Onar
echo 18. Disk Temizliği Başlat
echo 19. Tüm Programları Güncelle
echo 20. Güvenlik Duvarını Kapat
echo 21. Güvenlik Duvarını Aç
echo 22. Gereksiz Dosyaları Temizle
echo 23. RAM Optimizasyonu Yap
echo 24. Ping Testi Yap
echo 25. Tracert Yap
echo 26. Nslookup  Yap
echo 27. Netstat  Göster
echo 28. ARP Tablosunu Göster
echo 29. Route  Göster
echo 30. Sistem Bilgilerini Görüntüle
echo 31. IP Yapılandırmasını Görüntüle
echo 32. IP Yapılandırmasını Serbest Bırak
echo 33. IP Yapılandırmasını Yenile
echo 34. Windows Sürüm Bilgisi 
echo 35. Çık

set /p choice=Menüden Yapmak İstediğiniz Bir İşlem Numarsı Giriniz (1-35): 

if "%choice%"=="1" goto GPUPDATE
if "%choice%"=="2" goto IP
if "%choice%"=="3" goto LICENSE
if "%choice%"=="4" goto NBTSTAT_TEST
if "%choice%"=="5" goto WIFI_PASSWORD
if "%choice%"=="6" goto LAST_FORMAT_DATE
if "%choice%"=="7" goto DISK
if "%choice%"=="8" goto WINDOWSUPDATE
if "%choice%"=="9" goto CPUINFO
if "%choice%"=="10" goto MEMORY
if "%choice%"=="11" goto COMPUTER_INFO
if "%choice%"=="12" goto USERS
if "%choice%"=="13" goto STORAGE
if "%choice%"=="14" goto CHKDSK
if "%choice%"=="15" goto UPDATE_STORE_APPS
if "%choice%"=="16" goto CLEAR_DNS
if "%choice%"=="17" goto SFC
if "%choice%"=="18" goto CLEANUP
if "%choice%"=="19" goto UPDATE_PROGRAMS
if "%choice%"=="20" goto DISABLE_FIREWALL
if "%choice%"=="21" goto ENABLE_FIREWALL
if "%choice%"=="22" goto CLEAN_TEMP_FILES
if "%choice%"=="23" goto OPTIMIZE_RAM
if "%choice%"=="24" goto PING_TEST
if "%choice%"=="25" goto TRACERT_TEST
if "%choice%"=="26" goto NSLOOKUP_TEST
if "%choice%"=="27" goto SYSINFO
if "%choice%"=="28" goto ARP_TEST
if "%choice%"=="29" goto ROUTE_TEST
if "%choice%"=="30" goto NBTSTAT_TEST
if "%choice%"=="31" goto IPCONFIG
if "%choice%"=="32" goto RELEASE_IP
if "%choice%"=="33" goto RENEW_IP
if "%choice%"=="34" goto WINVER
if "%choice%"=="35" exit
goto MENU

:: Bilgisayar Seri Numarası, Bilgisayar Adı, Marka ve Modelini Göster
:COMPUTER_INFO
cls
echo Bilgisayar Seri Numarası:
wmic bios get serialnumber
echo.
echo Bilgisayar Adı:
hostname
echo.
echo Bilgisayar Marka ve Modeli:
wmic computersystem get manufacturer, model
pause
goto MENU

:: IP Adresini Görüntüle
:IP
cls
echo Bilgisayarın IP Adresi:
ipconfig | findstr /i "IPv4"
pause
goto MENU

:: Windows Lisans Durumunu Göster
:LICENSE
cls
echo Windows Lisans Durumu:
slmgr /xpr
echo.
echo Windows Lisans Anahtarı:
wmic path softwarelicensingservice get OA3xOriginalProductKey
pause
goto MENU

:: Sistem Bilgilerini Görüntüle
:SYSINFO
cls
echo Sistem Bilgileri:
systeminfo
pause
goto MENU

:: Windows Sürüm Bilgisi Göster (winver)
:WINVER
cls
echo Windows Sürüm Bilgisi:
winver
pause
goto MENU

:: Son Format Tarihini Göster
:LAST_FORMAT_DATE
cls
echo Son Format Tarihi:
wmic os get installdate
pause
goto MENU

:: Disk Durumunu Kontrol Et
:DISK
cls
echo Disk Durumu:
wmic logicaldisk get caption, description, freespace, size
pause
goto MENU

:: Windows Güncelleme Durumunu Göster
:WINDOWSUPDATE
cls
echo Windows Güncelleme Durumu:
wmic qfe list brief /format:table
pause
goto MENU

:: CPU Bilgilerini Göster
:CPUINFO
cls
echo CPU Bilgileri:
wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed
pause
goto MENU

:: Bellek (RAM) Kullanımını Göster
:MEMORY
cls
echo Bellek (RAM) Kullanımı:
wmic memorychip get capacity, speed, manufacturer
pause
goto MENU

:: Grup Politikalarını Güncelle (gpupdate /force)
:GPUPDATE
cls
echo Grup Politikaları Güncelleniyor...
gpupdate /force
pause
goto MENU

:: Kullanıcı Hesaplarını Listele
:USERS
cls
echo Kullanıcı Hesapları:
net user
pause
goto MENU

:: Depolama Alanı Durumunu Göster
:STORAGE
cls
echo Depolama Alanı Durumu:
wmic logicaldisk get caption, description, freespace, size
pause
goto MENU

:: Sabit Diski Tarama (chkdsk)
:CHKDSK
cls
echo Sabit diski tarıyor...
chkdsk C: /f /r /x
pause
goto MENU

:: Güvenlik Duvarını Kapat
:DISABLE_FIREWALL
cls
echo Güvenlik Duvarı devre dışı bırakılıyor...
netsh advfirewall set allprofiles state off
pause
goto MENU

:: Güvenlik Duvarını Aç
:ENABLE_FIREWALL
cls
echo Güvenlik Duvarı açılıyor...
netsh advfirewall set allprofiles state on
pause
goto MENU

:: Windows Sistem Dosyalarını Onar
:SFC
cls
echo Sistem dosyaları taranıyor...
sfc /scannow
pause
goto MENU

:: Disk Temizliği Başlat
:CLEANUP
cls
echo Disk Temizliği başlatılıyor...
cleanmgr
pause
goto MENU

:: Yüklü Programları Güncelle (winget)
:UPDATE_PROGRAMS
cls
echo Yüklü programlar güncelleniyor...
winget upgrade --all
pause
goto MENU

:: Windows Store Uygulamalarını Güncelle
:UPDATE_STORE_APPS
cls
echo Windows Store uygulamaları güncelleniyor...
powershell -Command "Get-AppxPackage | Foreach {Add-AppxPackage -Path $_.InstallLocation} "
pause
goto MENU

:: Ağ DNS Önbelleğini Temizle
:CLEAR_DNS
cls
echo DNS Önbelleği temizleniyor...
ipconfig /flushdns
pause
goto MENU

:: Gereksiz Dosyaları Temizle
:CLEAN_TEMP_FILES
cls
echo Geçici dosyalar temizleniyor...

:: %TEMP% Klasöründeki Dosyaları Sil
del /q /f /s %TEMP%\*

:: %WINDIR%\Temp Klasöründeki Dosyaları Sil
del /q /f /s %WINDIR%\Temp\*

:: Windows Temp Klasörünü Temizle
cleanmgr /sagerun:1

echo Temizlik tamamlandı.
pause
goto MENU

:: RAM Optimizasyonu Yap
:OPTIMIZE_RAM
cls
echo RAM optimizasyonu yapılıyor...
echo.
echo Çalışan işlemler sonlandırılacak...
echo.
taskkill /f /im explorer.exe
start explorer.exe
pause
goto MENU

:: Ping Testi Yap
:PING_TEST
cls
echo Ping testi yapılıyor...
set /p ip=Ping testi yapılacak IP adresini girin: 
ping %ip%
pause
goto MENU

:: Tracert (Yol İzleme) Yap
:TRACERT_TEST
cls
echo Tracert (Yol İzleme) başlatılıyor...
set /p ip=Yol izlenecek IP adresini girin: 
tracert %ip%
pause
goto MENU

:: Nslookup (DNS Sorgulaması) Yap
:NSLOOKUP_TEST
cls
echo Nslookup (DNS Sorgulaması) başlatılıyor...
set /p domain=DNS sorgusu yapılacak domain girin: 
nslookup %domain%
pause
goto MENU

:: Netstat (Bağlantı Durumu) Göster
:NETSTAT_TEST
cls
echo Netstat (Bağlantı Durumu) başlatılıyor...
netstat -an
pause
goto MENU

:: ARP Tablosunu Göster
:ARP_TEST
cls
echo ARP Tablosu başlatılıyor...
arp -a
pause
goto MENU

:: Route Tablosunu Göster
:ROUTE_TEST
cls
echo Yönlendirme Tablosu başlatılıyor...
route print
pause
goto MENU

:: NBTstat (NetBIOS Durumu) Göster
:NBTSTAT_TEST
cls
echo NBTstat (NetBIOS Durumu) başlatılıyor...
nbtstat -n
pause
goto MENU

:: IP Yapılandırmasını Göster
:IPCONFIG
cls
echo IP Yapılandırması:
ipconfig
pause
goto MENU

:: IP Yapılandırmasını Serbest Bırak
:RELEASE_IP
cls
echo IP Yapılandırması serbest bırakılıyor...
ipconfig /release
pause
goto MENU

:: IP Yapılandırmasını Yenile
:RENEW_IP
cls
echo IP Yapılandırması yenileniyor...
ipconfig /renew
pause
goto MENU

:: Wi-Fi Şifresini Göster
:WIFI_PASSWORD
cls
echo Wi-Fi Şifresi:
set /p wifi=Wi-Fi ağ adını girin: 
netsh wlan show profile name="%wifi%" key=clear | findstr /i "Key Content"
pause
goto MENU