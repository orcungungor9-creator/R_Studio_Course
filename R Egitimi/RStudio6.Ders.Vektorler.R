# Temel seviye R egitimi altinci ders 


# ~~~~~~~~( Vektorler & Vektor Olusturma )~~~~~~~~~~

# Kodlama gecmisi olanlar bilir; birden fazla veriyi tek bir degiskende tutmak
# istedigimizde array'ler veya listeler kullaniriz. 
# R dilinde bunun en temel ve en baba hali "Vektor"dur. 

# Vektorleri bir tren katarina benzetebilirsiniz. Tek bir isme sahip ama icinde
# birden fazla vagon (veri) tasiyor.

# Vektor olusturmak icin R'in en me??hur fonksiyonunu kullaniriz: c() 
# ??ngilizce "combine" (birlestir) kelimesinin bas harfidir.


# Ornek:
# Tipki degiskenler gibi cikti almak icin sadece ismini yazip calistirmamiz yeterli:
Uyeler <- c("Orcun", "Furkan", "Ahmet") # Metin tipi 
Uyeler # Konsolda: "Orcun" "Furkan" "Ahmet" yazar.

kilolar <- c(75, 80, 85) # Sayi tipi 
kilolar # Konsolda: 75,80,85 yazar

Mantik <- c(TRUE,FALSE,TRUE) # Mantik tipi
Mantik # Konsolda: TRUE FALSE  TRUE yazar





# ~~~~~~~~( ALTIN KURAL: Tek Tip Veri Zorunlulugu )~~~~~~~~~~

# Diger dillerdeki listelerden farkli olarak R'da bir vektorun icindeki 
# TUM ELEMANLAR ayni veri tipinde olmak ZORUNDADIR. 

# Ya hepsi metin olacak, ya hepsi sayi, ya da hepsi mantiksal (TRUE/FALSE).
# Peki "Ben asi bir insanim, hem sayi hem metin koyacagim" derseniz ne olur? 
# R hata vermez, ama sinsice tum sayilari metne cevirir!

karisik_vektor <- c("Furkan", 70, TRUE)

# Bu kodu calistirip icine bakarsaniz, 70'in ve TRUE'nun artik tirnak icinde 
# "70" ve "TRUE" seklinde metne donustugunu gorursunuz. Buna R dilinde "Coercion" denir.
# Veri analizi yaparken hesaplama hatalarinin %90'i buradan patlar. Dikkat!





# ~~~~~~~~( Vektorlerden Eleman Cekme - Indexing )~~~~~~~~~~

# R DILINDE SAYMAYA SIFIRDAN DEGIL, BIRDEN BASLANIR!

# 'Uyeler' vektorunun ilk elemani 0. index degil, 1. indextir.(Her eleman bir indextir)
# ??cinden bir elemani cagirmak icin koseli parantez [] kullaniriz.

Uyeler[1]  # Bize "Orcun"u verir. Diger dillerdeki gibi Uyeler[0] yazarsaniz patlarsiniz.
Uyeler[3]  # Bize "Ahmet"i verir.

# ??stersek birden fazla elemani da cekebiliriz (Yine c() kullanarak):
Uyeler[c(1, 3)] # 1. ve 3. elemani (Orcun ve Ahmet) ayni anda getirir.


kilolar[1] < kilolar[3] # TRUE verir.

class(kilolar) #[1] "numeric"

class(karisik_vektor) #[1] "character" gordugunuz gibi hepsini metin tipine cevirdi.




# ~~~~~~~~( Otomatik Vektor Olusturma: seq() ve rep() )~~~~~~~~~~

# Bazen 100 tane sayiyi elle tek tek girmek ameleliktir. 
# R, kuralli vektorler uretmek icin bize iki harika komut sunar.

# 1. seq() -> Sequence (Siralama)
# Belli bir aralikta, belli adimlarla sayi uretir. (Python'daki range gibi)
# 10'dan basla, 100'e kadar git, 10'ar 10'ar atla:
onarli_sayilar <- seq(from = 10, to = 100, by = 10) 
# Cikti: 10 20 30 40 50 60 70 80 90 100

# 2. rep() -> Repeat (Tekrar)
# Ayni degeri veya vektoru istedigimiz kadar tekrar ettirir.
tekrarli_veri <- rep("Kratos", times = 3) 
# Cikti: "Kratos" "Kratos" "Kratos"




# ~~~~~~~~( Vektor Ici Islemler ve Matematik )~~~~~~~~~~

# R'in en buyuk gucu vektorleri birbirleriyle hizlica isleme sokmasidir.
# Diyelim ki gunluk alinan kaloriler ve yakilan kaloriler elimizde:
alinan_kalori <- c(2500, 2700, 2400)
yakilan_kalori <- c(2800, 2500, 2600)

# Gunluk net kalori durumunu tek satirda bulabiliriz (Dongu yazmaya gerek yok!):
net_kalori <- alinan_kalori - yakilan_kalori
# Cikti: -300  200 -200 (Vektorun icindeki ayni indexteki sayilari birbiriyle isleme soktu)

# Vektorun icindeki tum sayilarin toplamini (sum) veya ortalamasini (mean) alma:
toplam_alinan <- sum(alinan_kalori)
ortalama_yakilan <- mean(yakilan_kalori)




# ~~~~~~~~( Vektor Elemanlarina Isim Verme: names() )~~~~~~~~~~

# Vektorlerdeki verilerin kime veya neye ait oldugunu bilmek icin isim (name) atayabiliriz.
guc_seviyeleri <- c(95, 100, 90)

# Simdi bu sayilarin sirasiyla kimlere ait oldugunu belirtelim:
names(guc_seviyeleri) <- c("Geralt", "Ciri", "Yennefer")

guc_seviyeleri
# Konsol ciktisi soyle gorunur:
#  Geralt     Ciri Yennefer 
#      95      100       90

# Artik index numarasi yerine direkt isimle de eleman cekebiliriz:
guc_seviyeleri["Ciri"] # Bize 100 degerini dondurur.





# ~~~~~~~~( Kategorik Vektorler: Factor ve Levels )~~~~~~~~~~

# Eger elimizdeki veri rastgele metinler degil de, belirli siniflara ayrilabilen 
# (kategorik) verilerse, onlari "factor" olarak tanimlamamiz gerekir.

# Ornegin bir haftalik beslenme ogunleri:
ogunler <- c("Aksam", "Sabah", "Ogle", "Sabah", "Aksam")

# Bu siradan bir karakter vektorudur. Ancak biz R'a "Bunlar siradan metin degil, 
# bunlar benim ogun kategorilerim" demek istiyorsak factor() kullaniriz:
ogun_faktor <- factor(ogunler)

ogun_faktor
# Ciktida extra olarak sunu goruruz: Levels: Aksam Ogle Sabah
# "Level" (Seviye), bu verinin icinde benzersiz kac tane kategori oldugunu gosterir.
# Ozellikle ileride grafik cizerken, R bu level'lara gore veriyi otomatik gruplayacak ve 
# her ogune ayri bir renk verecektir. Veri analizinin kalbi buradir!


class(ogun_faktor) # Sinifini gosterir.

levels(ogun_faktor) # Levellerimizi listeler.

ls() # Environmentte ne var ne yok tum degiskenlerimizi listeler

# ~~~~~~~~( Ortam Temizligi ve Hafiza: rm Komutu )~~~~~~~~~~

# rm() -> Remove (Sil). R'in cop tenekesidir.
# Isimiz biten degiskenleri, tablolari veya vektorleri R'in 
# hafizasindan (Environment panelinden) kalici olarak silmek icin kullaniriz.

# Uzerinde calismak icin gecici iki degisken yaratalim:
cop_vektor <- c(1, 2, 3)
cop_tablo <- data.frame(a = c(1,2), b = c(3,4))
tahil_fiyatlari <- 2:20


# 1. Tek bir seyi silmek:
rm(cop_vektor)
# Artik konsola cop_vektor yazarsaniz R size "Boyle bir obje bulunamadi" der. C??pe gitti.

# 2. Birden fazla seyi ayni anda silmek:
# Araya virgul koyarak toplu temizlik yapabiliriz:
rm(cop_tablo, tahil_fiyatlari) 

# 3. ls() komutunun hafizadaki her seyin listesini verdigini biliyoruz.
# Eger rm() komutuna "listemdeki her seyi sil" talimatini verirsek,
# R'in hafizasindaki tum kayitli verileri tek tusta yokedebiliriz:

rm(list = ls())

# Bu komutu calistirdiginizda sag ustteki Environment (Hafiza) paneli 
# tertemiz, bombos olur. Yeni bir projeye baslarken ortaligi temizlemek 
# ve eski verilerin yeni kodlari bozmasini engellemek icin kullaniriz.
