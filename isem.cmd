
@ECHO OFF

set device_name=POCO X3 NFC (surya)
set rec_name=TWRP
set rec_ver=3.4.0-15
set rec_auth=mauronofrio
set rec_team=mauronofrio
set rec_date=05.10.2020
set rec_img=recovery.img
set rec_edit=alicangonullu.xyz Youtube Kanali
set cmdoc=C:\root\
set fs=/storage/emulated/0
set copymagis=\\POCO X3 NFC\Samsung SD kartı

TITLE %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
color 4f

:LOGO
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz  TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.              RECOVERY TEMEL BILGILER
ECHO.
ECHO.              REC. Adi :%rec_name%                                
ECHO.              REC. Ver :%rec_ver%                       
ECHO.              Cihaz Adi:%device_name%           
ECHO.              Sahibi   :%rec_auth%                    
ECHO.              Ekip     :%rec_team%                    
ECHO.              Tarih    :%rec_date%                     
ECHO.              Duzenleme:%rec_edit%      
ECHO.                                                       
ECHO.                                                       
ECHO.***********************************************
ECHO.
ECHO.Devam etmek icin herhangi bir tusa basin...
pause>nul

:MENU
CLS
ECHO.***********************************************
ECHO.
ECHO.          Recovery Cikartiliyor :
ECHO.
ECHO.***********************************************
%cmdoc%7z.exe e %cmdoc%recovery.zip -o%cmdoc% -r
CLS
ECHO.***********************************************
ECHO.
ECHO.          Magisk Yukleniyor :
ECHO.
ECHO. Permission Denied vb hatasi verirse dosyayi manuel sekilde sdcard icine kopyalayin
ECHO.
ECHO.***********************************************
%cmdoc%adb.exe push "%cmdoc%magis.zip" %fs%
copy "%cmdoc%magis.zip" %copymagis% 
timeout 35 > NUL
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz  TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.          Telefonun Simdiki Durumu:
ECHO.
ECHO.              1.Cihaz Acik
ECHO.
ECHO.              2.Bilmiyorum
ECHO.
ECHO.	alicangonullu.xyz Youtube Kanalina Abone Olmayi Unutmayin
ECHO.***********************************************
ECHO.
set choice=
set /p choice=Lutfen telefonunuzun durumuna uygun numarayi seciniz.
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto IN_SYSTEM
if /i "%choice%"=="2" goto OTHERS
ECHO.
ECHO.Yanlis giris yaptiniz, tekrar seciniz...
timeout /t 2 /nobreak >NUL
ECHO.
goto MENU


:OTHERS
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.            Cihazinizi lutfen acik konuma getiriniz
ECHO.
ECHO.Onceki menuye donmek icin herhangi bir tusa basin.
ECHO.Herhangi bir islem yapilmazsa, 6 saniye sonra otomatik olarak geri donecektir.
ECHO.***********************************************
ECHO.
timeout /t 6 >nul
echo.
goto MENU


:IN_SYSTEM
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.Lutfen telefonunuzu bilgisayariniza dogru sekilde baglayiniz:
ECHO.
ECHO.      Lutfen asagidaki islemleri yaptiginiza emin olunuz:
ECHO.      1.Bootloader kilidinin acik olduguna
ECHO.      2.Telefonun acik olduguna
ECHO.      3.USB hata ayiklamanin acik olduguna
ECHO.      4.Driverlarin bilgisayariniza dogru bir sekilde yuklenmis olduguna
ECHO.      5.Telefonunuz USB hata ayiklama yetkilendirmesini istediginde, her zaman yetkilendir secenegini sectiginize
ECHO.
ECHO.Devam etmek icin herhangi bir tusa basin...
ECHO.***********************************************
ECHO.
pause>nul
ECHO.        Cihazin dogru baglanip baglanmadigi kontrol ediliyor ...
ECHO.
ECHO.   (Bu arayuzde uzun sure kalirsaniz, lutfen yukaridakileri kontrol edin
ECHO.                      ve araci yeniden baslatin)
ECHO.***********************************************
ECHO.
timeout /t 2 /nobreak >NUL

%cmdoc%adb.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             Telefon yeniden baslatiliyor ...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.  (Bu arayuzde uzun sure kalirsaniz, lutfen araci yeniden baslatiniz)
ECHO.
%cmdoc%adb.exe reboot bootloader >NUL 2>NUL
timeout /t 3 /nobreak >NUL
goto FLASHING

:FLASHING
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.
ECHO.        Cihazin dogru baglanip baglanmadigi kontrol ediliyor ...
ECHO.
ECHO.
ECHO. Bu arayuzde uzun sure kalirsaniz, lutfen asagidaki islemleri yaptiginiza emin olunuz:
ECHO.
ECHO.        1.USB kablosunun dogru baglandigina
ECHO.        2.Driverlarin bilgisayariniza dogru bir sekilde yuklenmis olduguna
ECHO.        3.Telefonun Fastboot modunda acilmis olduguna
ECHO.
ECHO.        ve araci yeniden baslatin...
ECHO.***********************************************
timeout /t 2 /nobreak >NUL
%cmdoc%fastboot.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             TWRP Recovery cihaza yaziliyor...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.(Successfully yazarsa islem basarilidir, aksi halde twrp yuklenmemistir)
ECHO.
ECHO.   (Bu arayuzde uzun sure kalirsaniz, lutfen araci yeniden baslatiniz)
ECHO.
%cmdoc%fastboot.exe flash recovery "%cmdoc%%rec_img%" || goto FLASH_FAILED
timeout /t 6 /nobreak >NUL
goto FLASH_OVER


:FLASH_FAILED
ECHO.
ECHO. Hata!
timeout /t 6 /nobreak >NUL
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.
ECHO.                   Yazma Hatali!
ECHO.
ECHO.           1.Lutfen telefon modelinin dogru olup olmadigini kontrol edin
ECHO.           2.Telefonun Fastboot modunda acilmis oldugunu kontrol edin
ECHO.           3.Programi yeniden calistirin!
ECHO.             Yine basarili olmuyorsa iletisime gecin
ECHO.
ECHO.           Bu araci kullandiginiz icin tesekkur ederiz.
ECHO.
ECHO.           (Programdan cikmak icin herhangi bir tusa basin)
ECHO.***********************************************
ECHO.
timeout /t 1 /nobreak >NUL

%cmdoc%adb.exe reboot bootloader >NUL 2>NUL

pause >NUL
EXIT


:FLASH_OVER
CLS
ECHO.
ECHO.         %device_name% - alicangonullu.xyz TEK TUS TWRP YUKLEME ARACI
ECHO.***********************************************
ECHO.
ECHO.             Recovery basariyla yazildi.
ECHO.
ECHO.
ECHO.             Telefon yeniden baslayacak
ECHO.             Bu asamada Magisk ile kalici yukleme yapmaniz gerekiyor.
ECHO.             (TWRP-Salt Okunur-Yukle-%fs%/magis.zip-Yeniden Baslat)
ECHO.
ECHO.             Bu araci kullandiginiz icin tesekkur ederiz.
ECHO.
ECHO.             (Programdan cikmak icin herhangi bir tusa basin)
ECHO.***********************************************
ECHO.
%cmdoc%fastboot.exe boot "%cmdoc%%rec_img%"
pause >NUL

EXIT


