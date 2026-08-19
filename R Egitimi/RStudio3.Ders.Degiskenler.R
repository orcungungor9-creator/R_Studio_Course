# Temel seviye R egitimi ucuncu ders


# ~~~~~~~~( Degisken Nedir )~~~~~~~~~~

# Degisken neden kullaniriz ? Degisken, kullanacagimiz sahsi atama/atamalarimizdir.
# Degiskenler kod yazarken isimizi kolaylastiracak sahsi kutulardir.
# Bir islem yapar ve onu isimlendirirsiniz, belki 200 karakter olan bir islem 1 degisken olur.
# Ana kullanim amaci neredeyse tamamen bu oldugundan degisken isimlerini kisa tutariz.

# Calistirdigimiz komutlarin/kutularin "cikti" dedigimiz bir goruntusu olur.

# Komutlar bizim R yazilim dilimizde isimizi kolaylastiran onceden programlanmis islemlerdir.

# Ayni islemi kisa, uzun, daha kisa, daha uzun yollarla yapmak sizin ne kadar iyi sekilde 
# dili ogrendiginiz ile alakalidir. 

# Degisken dedigimiz kavram dilin en temellerinden biridir. Degiskeni olusturur ve kod
# icinde istedigimiz gibi cagiririz. Ancak degisken atarken belli basli kurallar vardir.

# Kutu olayini soyle aciklayayim, devasa bir islem yapip sonucunu her defasinda bir
# degisken, yani kutu ile cagirmak istiyorum. koca islemi degisken tutuyor.



# ~~~~( Degisken turleri ve Kurallari )


# 1. ATAMA OPERATORU (Assignment Operator)
# R dilinde bir veriyi isme baglamak icin "<-" kullanilir.
# Alt ve Tire tuslarina ayni anda basarak (Alt + -) bu isareti hizlica yapabilirsiniz.

sayi <- 10
metin <-" R egitimine hos geldiniz"

# 2. ISIMLENDIRME KURALLARI
# Bir degiskene her ismi veremezsiniz. Su kurallar hayati onem tasir:

# A) Sayi ile baslayamaz:
# 1degisken <- 5  (YANLIS)
degisken1 <- 5   # (DOGRU)

# B) Bosluk iceremez:
# benim verim <- 100 (YANLIS)
benim_verim <- 100   # (DOGRU - Alt tire kullanin)
benimVerim <- 100    # (DOGRU - CamelCase kullanin)

# C) Buyuk/Kucuk harf duyarlidir (Case Sensitive):
# R icin "veri", "Veri" ve "VERI" birbirinden tamamen farkli 3 degiskendir.

# D) Ozel karakter yasagi:
# Degisken isimlerinde !, ?, $, % gibi karakterler kullanilamaz. 
# Sadece nokta (.) ve alt tire (_) serbesttir.




# ~~~~( Degisken atama opsiyonlari)~~~~

# Degiskenler illa "<-" ile atanmaz, tek esittir "=" operatoru degisken atamaya yarar.
esittir = 850

850 -> esittir2 # Normalde sagdakini sola atariz, ama ok nereye atama oraya. 

# Not : " <- " standart kabul edilir, cogunlukla " <- " kullanilir.




# ~~~~( Temel Veri Tipleri )~~~~

# Olusturdugumuz her degiskenin bir "tipi" vardir. Bunu class() komutu ile sorgulatabiliriz.

# A) Numeric (Sayisal): Ondalikli veya tam sayilar.
boy <- 1.82
class(boy)

# B) Integer (Tam Sayi): Sayinin sonuna L harfi konularak belirtilir.
yas <- 25L
class(yas)

# C) Character (Metin): Her zaman cift veya tek tirnak icinde yazilir.
isim <- "Orcun"
class(isim)

# D) Logical (Mantiksal): Sadece Dogru (TRUE) veya Yanlis (FALSE) degeri alir.
ogrenci_mi <- TRUE
class(ogrenci_mi)

# olusturdugumuz degiskenleri listeler
ls()

# Bu komut olusturdugumuz bir seyi silmeye yarar, metnini silmez ama enviromentten siler.
rm()


# ~~~~( ????renci Deneyi )~~~~
# ??u anki environment'??nda ka?? de??i??ken var?
ls()

# "yas" de??i??kenini sil ve tekrar kontrol et
rm(yas)
ls()


# Dip Not; onceki video scriptinde T ve F yani TRUE ve FALSE'i R programlama dilinin 
# sirasiyla 1 ve 0 olarak algiladigindan bahsetmistim. 
# Bu ders degiskenleri ogretirken bunu da es gecmemek lazim, TRUE ya da FALSE su an oldugu
# gibi yazilirken ayrilmis degerlerdir, onlara deger atayamazsin, ama T ve F harflerine
# bir deger atarsan bundan sonra projede verdigin degerler ne ise onlar o degeri alir.


# ~~~~( Kucuk Bir Not: Eksik Veri (NA) )~~~~

# R'da ileride cok karsilasacagimiz bir terim var: NA (Not Available)
# NA, "Mevcut Degil" veya "kayip Veri" anlamina gelir. 
# Gercek hayatta veriler her zaman kusursuz degildir, misal bazen excel tablosundaki
# bir hucre bos kalir veya veri girilmez. Iste R bu bosluklari NA olarak tanimlar.
 
kayip_veri <- NA

# Su an icin bu kavrami sadece ismen bilmeniz yeterli. Ilerleyen derslerde 
# matrisler (matrices) ve veri tablolari (data frames) gibi buyuk yapilari islerken, 
# bos kalan hucrelerde NA kavraminin ne kadar hayati oldugunu ve bu kayip verilerle 
# nasil basa cikacagimizi cok daha detayli gorecegiz.
