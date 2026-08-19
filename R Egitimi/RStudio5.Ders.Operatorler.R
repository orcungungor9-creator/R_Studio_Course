# Temel seviye R egitimi besinci ders 


# ~~~~~~~~( OPERATORLER )~~~~~~~~~~

# Operatorler 5 alt gruba ayrilir ;
# Aritmatik (Matematiksel) operatorler
# Atama operatorleri
# Iliskisel (Karsilastirma) operatorleri
# Mantiksal operatorler
# Ozel operatorler




# Operatorler nedir, operatorler fonksiyon olmayan ama dilin icindeki komutlardir.
# 5 alt gruba ayrilirlar cunku birbirlerine oranla farklilardir, bazilari matematik icin, 
# bazilari ise daha sonrasinda gorecegimiz veri analizleri icin isleri hizlandirir,
# her operator sekil bakimindan birbirinden farklidir ve bazilarini klavyede tus kombolari
# yardimiyla cagiririz. 
# ilk iki operator turunu ( Aritmatik & Atama ) gordugunuz icin kalan ucunu gosterecegim.






# ~~~~~~~~( 3. Iliskisel (Karsilastirma) Operatorleri )~~~~~~~~~~

# Bu operatorler iki farkli degeri birbiriyle karsilastirir.
# Bize her zaman mantigsal bir cevap dondurur: TRUE (Dogru) veya FALSE (Yanlis).
# Ilerleyen derslerde devasa veri setlerini filtrelerken bunlari cok kullanacagiz.

boy <- 182
kilo <- 70
hedef_kilo <- 75

# Kucuktur (<) ve Buyuktur (>)
kilo < hedef_kilo   # Sonuc: TRUE (70, 75'ten kucuktur)
boy > 190           # Sonuc: FALSE (182, 190'dan buyuk degildir)

# Kucuk Esittir (<=) ve Buyuk Esittir (>=)
kilo <= 70          # Sonuc: TRUE (Kucuk veya esit mi diye sorar, esit oldugu icin TRUE)
boy >= 180          # Sonuc: TRUE

# Esittir (==) ve Esit Degildir (!=)
# COK ONEMLI KURAL: R dilinde tek "=" isareti atama yapmak icindir. 
# Eger iki deger birbirine esit mi diye sormak istiyorsak cift "==" kullanmaliyiz.

kilo == 70          # Sonuc: TRUE
kilo != hedef_kilo  # Sonuc: TRUE (70, 75'e esit degildir, yani dogru)






# ~~~~~~~~( 4. Mantigsal Operatorler )~~~~~~~~~~

# Birden fazla karsilastirma durumunu birbirine baglamak istedigimizde devreye girerler.

# AND (&) - VE Operatoru:
# Bagladigi TUM kosullarin dogru (TRUE) olmasini ister. Biri bile yanlissa FALSE verir.
(kilo < 75) & (boy > 180)   # TRUE & TRUE -> Sonuc: TRUE
(kilo == 75) & (boy > 180)  # FALSE & TRUE -> Sonuc: FALSE

# OR (|) - VEYA Operatoru:
# (Klavyede Alt Gr + Tire ya da Alt Gr + < tuslarina basarak yapilir)
# Kosullardan SADECE BIRININ dogru (TRUE) olmasi yeterlidir.
(kilo == 75) | (boy > 180)  # FALSE | TRUE -> Sonuc: TRUE (Boy tuttu icin kurtardi)

# NOT (!) - DEGIL Operatoru:
# Cikan mantigsal sonucu tam tersine cevirir.
!(kilo == 70)               # Normalde TRUE cikardi, ama basindaki ! onu FALSE yapti.






# ~~~~~~~~( 5. Ozel Operatorler )~~~~~~~~~~

# R dilinin veri bilimi konusundaki gucunu gosteren, isleri cok hizlandiran araclar.

# Dizi / Seri Olusturma (:)
# Iki deger arasindaki tum tam sayilari tek tek yazmak yerine hizlica uretir.
1:10                        # Konsola 1'den 10'a kadar sayilari basar.
gunler <- 1:7               # 1'den 7'ye kadar olan sayilari 'gunler' degiskenine atar.

# Icinde mi? (%in%)
# Bir degerin, bir listenin veya vektorun icinde olup olmadigini hizlica sorgular.
5 %in% 1:10                 # 5 sayisi, 1 ile 10 arasindaki sayilarin icinde mi? (TRUE)

# Bir metin ornegi verelim:
"Kratos" %in% c("Geralt", "Ciri", "Yennefer") 
# Sonuc: FALSE (Cunku Kratos bu grubun icinde yok)
# Buradaki c() vektor denilen bir ya da birden fazla veriyi gruplamaya yarayan komuttur. 

# Not: %>% (Pipe/Boru) operatoru gibi cok daha gelismis ozel operatorler de vardir,
# ancak onlari 'tidyverse' paketini islerken ayrica gorecegiz.
