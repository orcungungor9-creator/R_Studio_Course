# Temel seviye R egitimi yedinci ders 


# ~~~~~~~~( Matrisler & Matris Olusturma )~~~~~~~~~~

# Vektorleri ogrendik, simdi isleri iki boyutlu hale getiriyoruz.
# Matrisleri Excel tablosu gibi dusunebilirsiniz: Satirlar (rows) ve sutunlar (columns) vardir.
# Tipki vektorlerde oldugu gibi, bir matrisin icindeki TUM VERILER ayni tipte olmak zorundadir. 

# 1. matrix() komutu ile sifirdan matris uretmek icin:
# 1'den 9'a kadar sayilari alip 3 satir ve 3 sutunluk bir matris yapalim.
sayilar <- 1:9
matris1 <- matrix(sayilar, nrow = 3, ncol = 3)
matris1
# R, verileri matrise doldururken varsayilan olarak "sutun sutun" (asagi dogru) doldurur.

# Verileri satir satir (saga dogru) doldurmak isterseniz,
# byrow (satira gore) argumanini TRUE yapmalisiniz:
matris2 <- matrix(sayilar, nrow = 3, ncol = 3, byrow = TRUE)
matris2
# Dipnot: ncol kisminin 3 olacagini R otomatik hesaplayabilir, es gecilebilir. 




# ~~~~~~~~( Vektorleri Birlestirerek Matris Kurma )~~~~~~~~~~

# Sifirdan matris yazmak yerine elimizdeki hazir vektorleri birlestirebiliriz. 
# Iki temel komut: rbind() ve cbind()

Orcun <- c(70, 182, 25) # Kilo, Boy, Yas
Furkan <- c(80, 185, 26)
Ahmet <- c(85, 178, 24)

# Bu vektorleri alt alta "satir" (row) olarak dizelim: rbind() (Row Bind)
ekip_satir <- rbind(Orcun, Furkan, Ahmet)
ekip_satir

# Veya yan yana "sutun" (column) olarak dizelim: cbind() (Column Bind)
ekip_sutun <- cbind(Orcun, Furkan, Ahmet)
ekip_sutun

# rbind ve cbind komutlari mevcut matrise yeni satir veya sutun eklemek icin de kullanilir.
# Ornegin ekibe yeni biri katildi (Veli) ve onu matrisimize eklemek istiyoruz:
Veli <- c(72, 180, 23)
ekip_satir <- rbind(ekip_satir, Veli) 




# ~~~~~~~~( Satir ve Sutun Isimlendirme )~~~~~~~~~~

# Matrislerde sutun ve satirlari isimlendirmek verinin okunabilirligini artirir.
# colnames() -> Sutun isimleri icin
# rownames() -> Satir isimleri icin 

colnames(ekip_satir) <- c("Kilo", "Boy", "Yas")
ekip_satir




# ~~~~~~~~( Matrislerden Eleman Cekme - Indexing )~~~~~~~~~~

# Matrisler 2 boyutlu oldugu icin eleman cekerken [Satir, Sutun] formatini kullaniriz.
# Kural: Once satir, sonra sutun yazilir ve araya virgul konur.

ekip_satir[1, 2] # 1. Satir (Orcun), 2. Sutun (Boy) kesisimi -> Bize 182 verir.

# Sadece bir satirin veya sutunun tamamini cekmek isterseniz, diger tarafi bos birakirsiniz.
ekip_satir[2, ]  # 2. Satir (Furkan) gelir, sutun kismi bos oldugu icin tum bilgileri doner.
ekip_satir[, 3]  # Satir kismi bos, 3. Sutun (Yas) gelir. Tum ekibin yaslarini doner.

# Isimlendirme yaptigimiz icin index numarasi yerine direkt isim de yazabiliriz:
ekip_satir["Orcun", "Kilo"] # Orcun'un kilosunu verir (70).





# ~~~~~~~~( Matrislerde Eksik Veri (NA) ile Calismak )~~~~~~~~~~

# Diyelim ki Ahmet'in yas bilgisini yanlis girdik ve sildik, su an elimizde yok.
# Oraya 0 yazamayiz (Cunku 0 da bir yastir ve ortalamayi asagi ceker).
# Eksik veri oldugunu R'a belirtmek icin NA yazmaliyiz.

ekip_satir["Ahmet", "Yas"] <- NA
ekip_satir

# Bu ekibin yas ortalamasini almak istersek NA yuzunden hata aliriz:
mean(ekip_satir[, "Yas"]) # Sonuc: NA cikar.

# R'a NA degerlerini gormezden gelmesi icin na.rm = TRUE argumanini ekleriz:
mean(ekip_satir[, "Yas"], na.rm = TRUE) # Sadece gecerli yaslarin ortalamasini hesaplar.




# ~~~~~~~~( Matris Boyutlari ve Temel Islemler )~~~~~~~~~~

# dim() komutu matrisin satir ve sutun sayisini vektor olarak verir.
dim(ekip_satir)
dim(ekip_satir)[1] # Matrisin satir sayisini verir.
dim(ekip_satir)[2] # Matrisin sutun sayisini verir.

# 1. Hizli Toplam ve Ortalama (rowSums ve colMeans):
colMeans(ekip_satir, na.rm = TRUE) # Tum sutunlarin ortalamasini tek islemde verir.
rowSums(ekip_satir, na.rm = TRUE)  # Her satirin kendi icindeki toplamini verir.

# 2. Transpoz Alma (Satirlari Sutun, Sutunlari Satir Yapma):
# Tablonun yonunu degistirmek icin t() komutunu kullaniriz:
t(ekip_satir)

# 3. Matris Carpimi:
# matris * 2 -> Icindeki her elemani ayri ayri 2 ile carpar.
# matris1 * matris2 -> Ayni indeksteki elemanlari karsilikli carpar.
# matris1 %*% matris2 -> Lineer cebir kurallarina gore gercek matris carpimi yapar.

ls()

# Sonraki dersimizde tek tip veri zorunlulugu olmayan Veri Cercevelerini (Data frame) ogrenecegiz.
