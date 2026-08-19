# GOREV 1
# ??cinde farkli veri tipleri (metin, sayi, mantiksal) barindiran bir Data Frame olusturacagiz.
# 4 kisilik bir ogrenci listesi dusun.
# 'isim' (karakter), 'vize' (sayisal), 'final' (sayisal) ve 'derse_geldi' (TRUE/FALSE) 
# sutunlarindan olusan 'sinif_listesi' adinda bir data.frame olustur.
# Degerleri tamamen sen salla (orn: isim = c("Ali", "Ayse"...)).
Oyun_Gelistirme <- data.frame(
  isim  = c("Or??un","Ahmet","Deniz","Ege"),
  vize  = c(38,42,56,52),
  final = c(100,95,96,100),
  derse_geldi = c(TRUE,TRUE,FALSE,TRUE)
)


# GOREV 2
# Data Frame'in yapisini inceleme zamani. Sadece tabloya bakmak yetmez, arka planini gormeliyiz.
# Tablonun genel yapisini (hangi sutun hangi veri tipinde, kac satir var) gormek icin 'str()' fonksiyonunu kullan.
# Tablonun sadece ilk 2 satirini gormek icin 'head()' fonksiyonunu kullan (icine n=2 argumani girerek).
str(Oyun_Gelistirme)
head(Oyun_Gelistirme,n=2)


# GOREV 3
# Veri cekme (Indeksleme). ??ste Data Frame'in en buyuk silahi: Dolar isareti ($)!
# 'sinif_listesi' tablosunun icinden sadece 'vize' sutununu dolar isareti ($) kullanarak cekip ekrana bastir.
# Ardindan matrislerden aliskin oldugun koseli parantez mantigiyla, sadece 3. ogrencinin tum bilgilerini cek.
Oyun_Gelistirme$vize[3,] <-  # sadece 3. verisi
  


# GOREV 4
# Matematiksel islem ve yepyeni bir sutun ekleme.
# Her ogrencinin vizesinin %40'ini, finalinin %60'ini toplayarak donem sonu ortalamasini hesapla.
# Cikan bu matematiksel sonucu, 'sinif_listesi' icine "ortalama" adinda yepyeni bir sutun olarak dolar ($) ile ekle.
# (??pucu: sinif_listesi$yeni_sutun_adi <- ...)
donem_ortalamasi <- ((Oyun_Gelistirme$vize / 100)*40) + ((Oyun_Gelistirme$final / 100)*60)
Dersi_Gecenler <- cbind(Oyun_Gelistirme, Basari_Notu = donem_ortalamasi)

# Y??zdelik matematiksel islem (Seninkiyle ayni, biraz sadelestirilmis hali)
donem_ortalamasi <- (Oyun_Gelistirme$vize * 0.40) + (Oyun_Gelistirme$final * 0.60)

# Dolar isareti ile aninda yeni sutun ekleme
Oyun_Gelistirme$ortalama <- donem_ortalamasi
# GOREV 5 (BOSS SEV??YES??)
# Geldik filtrelemeye. ??ki farkli sartla veri setini daraltacagiz.
# Sadece hesapladigin "ortalama" sutunu 60'tan buyuk (>=) olan VE derse gelen (derse_geldi == TRUE) ogrencileri gormek istiyoruz.
# Bunu matrislerde kullandigin koseli parantez [ satir_sarti , ] mantigiyla ve '&' (VE) operatorunu kullanarak yap.
# Unutma: Virgulu koymazsan R tabloyu bozar!
# Sadece ortalamasi 60+ olan ve derse gelenleri getir
Gecenler <- Oyun_Gelistirme[ Oyun_Gelistirme$ortalama >= 60 & Oyun_Gelistirme$derse_geldi == TRUE , ]

# Sonucu gormek icin
Gecenler

Sene_Sonu <- cbind(Dersi_Gecenler,dersi_gecenler = gecenler)
