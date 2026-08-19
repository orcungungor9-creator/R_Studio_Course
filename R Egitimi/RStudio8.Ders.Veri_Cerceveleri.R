# Temel seviye R egitimi sekizinci ders 


# ~~~~~~~~( Veri Cercevesi "Data Frame" )~~~~~~~~~~

# R dilinin en onemli kismina geldik. Gecen ders matrisleri ogrendik ama cok buyuk bir 
# dezavantajlari vardi: Icine ya sadece sayi ya da sadece metin koyabiliyorduk.
# Gercek hayatta veriler boyle degildir. Bir Excel tablosunda(ornek olarak) isim (Metin), 
# yas (Sayi) ve sigorta durumu (Mantiksal) ayni anda bulunabilir. 

# Iste farkli veri tiplerini ayni tabloda, kavgasiz gurultusuz tutan yapiya 
# Veri Cercevesi (Data Frame) diyoruz. Python'daki Pandas kutuphanesinin DataFrame'i ile aynidir.


# 1. data.frame() ile Sifirdan Tablo Olusturma:
isimler <- c("Orcun", "Furkan", "Ahmet", "Atakan", "Deniz")
yaslar <- c(25, 26, 24, 95, 21)
kilolar <- c(70, 80, 85, 98, 55)
spora_gidiyor_mu <- c(TRUE, TRUE, FALSE, TRUE, TRUE)

# Simdi bunlari tek bir tabloda birlestirelim:
ekip_tablosu <- data.frame(isimler, yaslar, kilolar, spora_gidiyor_mu)

ekip_tablosu
# Ustelikte sayilar ve metinler matrislerdeki gibi "coercion"a ugrayip bozulmadilar, 
# kendi tiplerinde kaldilar.
# (coercion mevzusu zorunlu olarak hepsini metin turune donusturmesi)




# ~~~~~~~~( Sutun Cekmenin Kolay Yolu: Dolar "$" Operatoru )~~~~~~~~~~

# Data Frame'lerde hayat cok kolaydir. Istedigimiz sutunu ismen cagirmak icin 
# degisken adinin yanina '$' isareti koyariz.

ekip_tablosu$kilolar
# Cikti: 70 80 85 98 55 

# HATIRLATMA: R buyuk/kucuk harf duyarlidir!!!
# ekip_tablosu$Kilolar (buyuk K ile) yazarsaniz "NULL" (Yok) cevabi alirsiniz.





# ~~~~~~~~( Veri Setini Inceleme ve Ozetleme Opsiyonlari )~~~~~~~~~~

# Gercek hayatta karsiniza 5 satirlik degil, 5 milyon satirlik veriler cikacak.
# Veriyi hizlica tanimak icin su komutlarin parametrelerini (opsiyonlarini) kullaniriz:

head(ekip_tablosu)         # Tablonun ilk 6 satirini getirir.
tail(ekip_tablosu)         # Tablonun son 6 satirini getirir.
head(ekip_tablosu, n = 3)  # Tablonun sadece ilk 3 satirini getirir. (n = siz ne yazarsaniz)
tail(ekip_tablosu, n = 2)  # Sadece son 2 satiri getirir. (n = siz ne yazarsaniz)
str(ekip_tablosu)          # (Structure) Hangi sutun hangi veri tipinde, anatomiyi cikarir.
dim(ekip_tablosu)          # Boyutlar: c(5, 4) seklinde kac satir/sutun oldugunu soyler.
dim(ekip_tablosu)[1]       # tablonun kac satiri oldugunu soyler.
dim(ekip_tablosu)[2]       # tablonun kac sutunu oldugunu soyler.


# TUM TABLOYU tek komutla da ozetleyebiliriz. Sayisal sutunlarin ortalamasini,Q1,Q2,Median,
# min/max degerlerini; mantiksal sutunlarin ise kac tane TRUE/FALSE oldugunu tek kalemde doker:
# Hatta veri tipini gosterir sutunlarin.
summary(ekip_tablosu)

# Tek bir sutunun ??zetini de alabilirsiniz. 
summary(ekip_tablosu$yaslar) 

# Eger sirf bir sutunu cagirmak icin ustteki eziyete katlanmak istemezseniz Attach() var.
attach(ekip_tablosu) #Babaya icazeti verdik artik icindeki degiskenleri taniyoruz.
summary(yaslar)
# arkadaslar bu attach komutu biraz da korkunc bir kardes, acik kaldigi senaryoda baska bir
# veri setiyle calisirken bizim attach atadigimiz degisken isimleri var ise sorun yasariz
# bu sorunun ismi "Masking" bu sebeple attach acip  kullandiysak detach() komutu ile kapariz.
detach(ekip_tablosu) # Gecici serbestligi bitirdik. isimiz bitince attach'i kapatmaliyiz.




# ~~~~~~~~( Tabloyu Manipule Etme: Ekleme, Silme, Siralama ve Filtreleme )~~~~~~~~~~


# 1. Tabloya Yeni Sutun Ekleme:
# Tabloyu kurduk ama sonradan "Boy" bilgisini de eklemek istedik. 
# Yeniden data.frame() yazmaya gerek yok! '$' isaretiyle aninda yapistiririz:
ekip_tablosu$boylar <- c(182, 185, 178, 190, 175)
# R, bu yeni vektoru alir ve tablonun en sagina yepyeni bir sutun olarak ekler.


# 2. Sutun Silme:
# Diyelim ki "spora_gidiyor_mu" sutununa artik ihtiyacimiz yok. 
# O sutunun icine "NULL" (Hiclik) atarsak, sutun tamamen tarihe karisir:
ekip_tablosu$spora_gidiyor_mu <- NULL


# 3. Tabloyu Siralama (order):
# Excel'deki "A'dan Z'ye sirala" isleminin karsiligidir.
# Tabloyu yaslara gore kucukten buyuge (gencten yasliya) siralayalim:
ekip_tablosu[order(ekip_tablosu$yaslar), ] 

# "decreasing = TRUE" opsiyonu ile tam tersi (buyukten kucuge) siralayabiliriz:
ekip_tablosu[order(ekip_tablosu$yaslar, decreasing = TRUE), ]


# 4. Hizli Filtreleme (subset):
# Binlerce satirlik veriden sadece isimize yarayanlari cekmek icin harikadir.
# Sadece yasi 25'ten kucuk olan uyeleri tablo olarak getir:
subset(ekip_tablosu, yaslar < 25)

# Birden fazla sarti '&' (VE) ile baglayabiliriz:
# Yasi 25'ten kucuk VE kilosu 80'den buyuk olanlari getir:
subset(ekip_tablosu, yaslar < 25 & kilolar > 80)





# ~~~~~~~~( Paket Mantigi ve "tidyr" Paketi )~~~~~~~~~~

# R dilini yeni alinmis fabrikasyon bir telefon gibi dusunun. Icinde temel uygulamalar vardir.
# Ancak bazen verileri sekillendirmek, temizlemek ve adam etmek icin ozel araclara ihtiyac duyariz.
# Iste R'in veri temizleme ve sekillendirme konusundaki en unlu paketi "tidyr"dir.

# Eger bilgisayarinizda yoksa once su komutla indirmeniz gerekir (Sadece 1 kez yapilir):
# install.packages("tidyr")

# Paketi calismamiza cagiralim:
library(tidyr)



# ~~~~~~~~( Orijinal Boru (Pipe) Operatoru: %>% )~~~~~~~~~~

# tidyr paketini cagirdigimizda R'in en sevilen operatoru de yanimiza gelir: %>%
# Pipe operatoru "VE SONRA..." demektir. Kodlarin ic ice gecip kafamizi karistirmasini 
# engeller, yukaridan asagiya selale gibi akmasini saglar.
# RStudio K??sayolu: Ctrl + Shift + M 

# Klasik ic ice yazim (Okumasi ve anlamasi zordur, sondan basa okunur):
# summary(subset(ekip_tablosu, yaslar < 25))

# %>% ile modern yazim (Soldan saga dogru akar, yormaz):
ekip_tablosu %>% 
  subset(yaslar < 25) %>% 
  summary()

# G??rd??g??n??z gibi: Tabloyu al %>% 25'ten kucukleri filtrele %>% En son ozetini cikar!





# ~~~~~~~~( Veri Sekillendirme: separate ve pivot_longer )~~~~~~~~~~

# --- 1. Sutun Ayirma (separate) ---
# Bazen bize gelen verilerde iki farkli bilgi tek bir sutuna sikismistir. 
# Ornegin elimizde uyelerin bulundugu sehir ve bolge kodlari tek sutunda olsun:
ekip_tablosu$konum_kodu <- c("Denizli_Ege", "Izmir_Ege", "Ankara_Anadolu", "Istanbul_Marmara", "Denizli_Ege")

# Bu "konum_kodu" sutununu "_" isaretinden ikiye bolup ayri sutunlar yapalim:
ekip_tablosu <- ekip_tablosu %>% 
  separate(col = konum_kodu, into = c("Sehir", "Bolge"), sep = "_")

ekip_tablosu # Artik tertemiz iki ayri sutunumuz var!



# --- 2. Genisten Uzuna Donusturme (pivot_longer) ---
# Ekonometride (ozellikle panel veri analizlerinde) yillara ait verilerin yan yana 
# sutunlarda durmasi analizi zorlastirir.
# Test etmek icin ufak bir makroekonomik veri seti kuralim:

makro_veri <- data.frame(
  Ulke = c("TR", "DE"),
  Yil_2024 = c(4.5, 1.2),
  Yil_2025 = c(5.0, 1.5)
)

makro_veri # Bu tablo "Genis" formattadir. Yillar sutun ismi olmus, bu iyi degil!

# Yillari ve oranlari tek sutuna toplayip veriyi asagiya dogru uzatmak icin 
# modern R'in en guclu araci olan pivot_longer() komutunu kullaniyoruz:

uzun_veri <- makro_veri %>% 
  pivot_longer(
    cols = c(Yil_2024, Yil_2025),  # Hangi sutunlari asagiya indirecegiz?
    names_to = "Yil",              # Eski sutun isimleri hangi yeni sutuna gitsin?
    values_to = "Buyume_Orani"     # Icerideki rakamlar hangi yeni sutuna gitsin?
  )

uzun_veri # Iste verimiz analize ve regresyona yuzde yuz hazir hale geldi!

ls()



# --- Tablo Boyutlarini Ogrenmenin Ekstra Yolu ---

nrow(ekip_tablosu)  # Number of ROWs (Satir Sayisi) -> Bize satir sayisini verir.
ncol(ekip_tablosu)  # Number of COLumns (Sutun Sayisi) -> Bize sutun sayisini verir.

# "Peki bu benim ne isime yarayacak?" derseniz: 
# Ileride "for donguleri (loops)" yazarken "Tablonun 1. satirindan basla, son satirina 
# kadar git" demek istedigimizde o "son satir" kismina elle 5 yazmak yerine, dinamik 
# olarak nrow(ekip_tablosu) yazacagiz! Boylece tabloya yeni biri eklendiginde kodumuz patlamayacak.