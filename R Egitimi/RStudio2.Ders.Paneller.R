# Temel seviye R egitimi birinci ders 


# ~~~~~~~~(R-RStudio nasil kurulur & R studio panelleri )~~~~~~~~~~


# R, istatistiksel hesaplamalar ve veri gorsellestirme icin ozel olarak tasarlanmis, 
# acik kaynak kodlu bir programlama dilidir. Dunya genelinde veri bilimciler, istatistikciler
# ve akademisyenler tarafindan en cok tercih edilen dillerden biridir.


# 1. = Source (Kaynak) Paneli - Sol Ust:
# Burasi kodlarinizi yazdiginiz, sakladiginiz ve duzenlediginiz yerdir. 
# R script dosyalariniz burada acilir. 
# Kodlarinizi direkt konsola yazmak yerine buraya yazip kaydetmek, 
# calismanizin surekliligi acisindan kritik onemdedir. 
# Yazdiginiz kod satirini calistirmak icin "Run" ya da "CTRL+Enter" butonunu kullaniriz.

  
  
  
# 2. Console (Konsol) Paneli - Sol Alt:
# R'in kalbi burasidir. Yazdiginiz kodlarin ciktilarini, sonuclari ve varsa hata mesajlarini 
# buradan takip edersiniz. Gecici kod denemeleri yapmak icin de uygundur ancak buraya yazilan
# kodlar kaydedilmez. Bu sepeble gecici kodlari buradan ve kaydetmek istedigimiz proje kodlarini
# da R script kullanarak yazariz.

  
  
  
# 3. Environment, History ve Connections Paneli - Sag Ust:
# Environment: Calisma suresince olusturdugunuz tum degiskenler, veri setleri (data frames) 
# ve fonksiyonlar burada listelenir. Hangi verinin hafizada oldugunu buradan gorebilirsiniz.
# History: Daha once calistirdiginiz tum kodlarin dokumunu burada bulabilirsiniz.
  
  
  
  
# 4. Files, Plots, Packages ve Help Paneli - Sag Alt:
# Bu panel cok fonksiyonlu bir yardimci alandir:
# Files: Bilgisayarinizdaki dosya dizinini gosterir, projelerinizi yonetmenizi saglar.
# Plots: Cizdiginiz grafiklerin onizlemesi burada goruntulenir.
# Packages: R'a yuklu olan paketleri yonetmenize, yenilerini yuklemenize veya 
# guncellemenize olanak tanir.
# Help: Herhangi bir fonksiyonun nasil calistigini ogrenmek istediginizde, 
# dokumantasyonlar bu sekmede acilir.



# ben burada toplama yaptim 
2+2
 

5 > 3
3 > 5

# R studio icin TRUE 1 VE FALSE 0 olarak gozukur, TRUE == 1 derseniz TRUE cevabini alirsiniz.
# aynisi false icin de gecerlidir (FALSE == 0 derseniz TRUE ciktisi gelir.)
T == 4
TRUE == 1
FALSE == 0


q() #oturumu kapatmak icin konsola bunu yazariz. 
