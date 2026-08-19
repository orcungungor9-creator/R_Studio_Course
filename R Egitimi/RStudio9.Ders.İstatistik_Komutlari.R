# Temel seviye R egitimi dokuzuncu ders 


# ~~~~~~~~( Ileri Istatistik ve Ekonometriye Giris )~~~~~~~~~~

# Gecen ders verilerimizi (Data Frame) adam etmeyi ogrendik. Simdi bu verileri
# konusturma, analiz etme ve gelecegi tahmin etme zamani!
# Bu dersi temel yetenek agaclarina ayiriyoruz:



# ==============================================================================
# 0. EN ONEMLI YETENEK: YARDIM ALMAK (Help Komutu)
# ==============================================================================

# R'da binlerce komut ve her komutun (vektor, matris, tablo icin) farkli varyasyonlari vardir. 
# Bunlari ezberlemek imkansizdir! Gercek bir analist takildiginda veya bir fonksiyonun 
# icine hangi parametreleri aldigini unuttugunda R'in kendi kilavuzuna basvurur.

?mean       # Calistirdiginiz an sag alt panelde (Help sekmesinde) resmi kilavuz acilir.
help(scale) # "?" ile ayni isi yapar. Fonksiyonun tum kullanim senaryolarini gosterir.

# KURAL: Kod yazarken tikanirsaniz, internette aramadan once fonksiyonun basina "?" koyun!



# ==============================================================================
# 1. VERI MANIPULASYONU: Kategorik ve Eksik Veriler
# ==============================================================================

# --- A) as.factor() ile Kategorilendirme ---
# R'a bir metnin sadece rastgele bir yazi degil, bir "kategori" (Orn: Cinsiyet, Sehir) 
# oldugunu soylemek, ileride kuracagimiz modellerin dogru calismasi icin sarttir.
kan_gruplari <- c("A", "B", "0", "AB", "A", "0")
kan_faktor <- as.factor(kan_gruplari)

# levels() -> Bu verinin icinde "benzersiz" hangi kategoriler var diye listeler.
levels(kan_faktor) # Cikti: "0" "A" "AB" "B" (Alfabetik siralar)


# --- B) Eksik Veri (NA) Kontrolu ve Temizligi ---
# Gercek hayatta veriler kusursuz gelmez. R, bos veya kayip hucreleri "NA" olarak okur.
kirli_vektor <- c(10, 20, NA, 40, NA, 60)

is.na(kirli_vektor)      # Bize TRUE / FALSE sirasi doner. (TRUE olanlar bos veridir)
sum(is.na(kirli_vektor)) # Veri setinde toplam kac tane bos hucre var? (Cikti: 2)

# Tablodaki tum NA'lari cope atip temiz bir vektor/tablo yaratmak isterseniz:
temiz_vektor <- na.omit(kirli_vektor)



# ==============================================================================
# 2. VERIYI HIZLI TANIMA VE RONTGENINI CEKME (EDA)
# ==============================================================================

# Analize baslamadan once verinin fotografini ve rontgenini cekmeliyiz.
ornek_tablo <- data.frame(
  yas = c(20, 25, 22, 28, 24),
  kilo = c(70, 80, 75, 90, 65),
  spor_yapiyor_mu = c(TRUE, FALSE, TRUE, TRUE, FALSE)
)

# --- A) Tabloyu Excel Gibi Gormek: View() ---
# RStudio'nun en sevilen ozelligidir. (Bas harfi Buyuk V ile yazilir!)
# Kod calistiginda veriyi sag ustte gercek bir tablo formunda acar.
View(ornek_tablo)

# --- B) Verinin Anatomisi ve Kimligi ---
str(ornek_tablo)        # Structure: Hangi sutun hangi veri tipinde gosterir.
class(ornek_tablo)      # Objenin kimligini soyler. (Cikti: "data.frame")
attributes(ornek_tablo) # Tablonun arka planindaki meta verileri (isimler, satir nolari) ceker.

# --- C) Uzunluk ve Frekans (Siklik) ---
length(ornek_tablo)     # Bir tablonun SUTUN SAYISINI verir. Vektorde eleman sayisini verir.

# table() -> Kategorik veya mantiksal verilerde mukemmeldir!
# "Hangi secenekten kac tane var?" sorusunun cevabini cikarir:
table(ornek_tablo$spor_yapiyor_mu) 
# Cikti: FALSE (2 kisi), TRUE (3 kisi)

# --- D) Sihirli Ozet Komutu: summary() ---
# summary() bir bukalemundur. Icine ne koyarsaniz ona gore ozet cikarir!
summary(ornek_tablo) 
# Sayisal sutunlarin min, max, ortalama ve ceyrekliklerini (Q1, Q3) tek kalemde doker.



# ==============================================================================
# 2.5 TANIMLAYICI ISTATISTIKLER (TEKIL KOMUTLAR)
# ==============================================================================

vektor <- c(10, 50, 20, 40, 30)

mean(vektor)       # Ortalama
range(vektor)      # Hangi aralikta? (min ve max ayni anda)
which.max(vektor)  # En buyuk deger kacinci sirada? (Cikti: 2. sirada)

# Icerisinde NA olan bir verinin ortalamasini alirken hata almamak icin:
mean(kirli_vektor, na.rm = TRUE) # (Eksik veriyi gormezden gel)

var(vektor)        # Varyans
sd(vektor)         # Standart Sapma
# KRITIK NOT: R'in var() ve sd() komutlari 'Orneklem' formuluyle (N-1) hesap yapar.

# scale() -> Farkli boyutlardaki verileri (Orn: 3200 Kalori ve 5 Saat Uyku) 
# ayni teraziye koymak ve Z-skoruna cevirmek icin kullanilir.
scale(vektor) 

calisma_saati <- c(2, 4, 6, 8, 10)
sinav_notu <- c(40, 55, 70, 85, 95)

cov(calisma_saati, sinav_notu) # Kovaryans (Birlikte hareketin yonu)
cor(calisma_saati, sinav_notu) # Korelasyon (Standartlasmis hali, -1 ile +1 arasinda)



# ==============================================================================
# 3. OLASILIK VE RASTGELE SAYI URETIMI (DAGILIMLAR)
# ==============================================================================

set.seed(123) # Rastgeleligi sabitlemek icin (Herkes ayni sayilari uretsin diye)

# 1. Normal Dagilim (rnorm):
# Doga olaylarinin cogu bu can egrisine uyar. En cok kullanilan komuttur.
# Parametreler: n (kac adet?), mean (ortalama), sd (standart sapma)
normal_veri <- rnorm(n = 10, mean = 180, sd = 5) 

# 2. Bernoulli ve Binom Dagilimi (rbinom):
# Sadece iki ihtimalli (Yazi/Tura, Gecti/Kaldi) durumlar icindir.
yazi_tura <- rbinom(n = 10, size = 1, prob = 0.5) 

# 3. Uniform / Tekduze Dagilim (runif):
# Belirli bir araliktaki her sayinin gelme ihtimali esittir (Zar atmak gibi).
zar_gibi <- runif(n = 5, min = 1, max = 6)



# ==============================================================================
# 4. MAKINE OGRENMESININ TEMELI: REGRESYON
# ==============================================================================

# lm() -> Linear Model (Basit Dogrusal Regresyon)
# Yazim kurali: lm(Y ~ X) -> Y: Hedef/Bagimli, X: Etkileyen/Bagimsiz
# "7 saat calisirsam kac alirim?"
regresyon_modeli <- lm(sinav_notu ~ calisma_saati)

# Modeli kurduk, simdi o sihirli summary() komutunu modelin ustune salalim:
summary(regresyon_modeli)
# FARK ETTINIZ MI? summary() komutuna tablo verdigimizde ortalama hesaplarken,
# Regresyon modeli verdigimizde bize P-value, R-kare ve t-istatistiklerini doktu!

# Residuals (Hatalar/Kalintilar): 
# Gercek sinav notu ile modelimizin tahmin ettigi not arasindaki farktir.
hatalar <- residuals(regresyon_modeli)

# Hatalarin (Residuals) karesini alip toplarsaniz meshur RSS (Residual Sum of Squares) 
# degerine ulasirsiniz! Modelin ne kadar basarili oldugunun en temel olcutudur.
rss <- sum(hatalar^2)
rss

ls()