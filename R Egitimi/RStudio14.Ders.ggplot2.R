# Temel seviye R egitimi on dorduncu ders 


# ~~~~~~~~( Veri Gorsellestirme: ggplot2 ve Ileri Seviye Base R Ayarlari )~~~~~~~~~~

# Gecmis derslerde veriyi tanidik. Bu derste hem modern ggplot2 paketinin 
# katmanlarini ogrenecegiz hem de Base R (Temel R) grafiklerinde akla gelebilecek 
# tum ince ayarlari (renk, boyut, font, dis metin) adim adim isleyecegiz.
# Komutlarin ne ise yaradigini yandaki aciklamalari okuyarak, calistirdikca goreceksiniz.

# Gereken Kutuphaneler (library komutu pakedi aktif eder)
library("ggplot2")  # Katmanli modern grafik cizim pakedimiz
library("MASS")     # 'mammals' (memeliler) veri setini iceren istatistik pakedi
library("tibble")   # Veri yapisini modern ve okunakli gosteren paket



# ==============================================================================
# B??R??NC?? B??L??M: GGPLOT2 GEOMETR??LER?? ( Nokta, S??tun, ??izgi )
# ==============================================================================
# ggplot2'de aes (estetik) ile veriyi eksenlere atar, geom_ ile de sekli belirleriz.

# --- 1. NOKTA GRAF?????? (geom_point) VE A??IRI YI??ILMA (Overplotting) ????Z??MLER?? ---

# diamonds (elmaslar) verisinde x'e karat, y'ye fiyat koyup nokta (scatter) ciziyoruz.
ggplot(diamonds, aes(carat, price)) + 
  geom_point() # Noktalari tuvale basar. Ancak veriler ust uste biner!

# C??z??m: alpha ve shape
ggplot(diamonds, aes(carat, price)) + 
  geom_point(alpha = 0.3,       # alpha = 0.3: Noktalari %70 saydam yapar, ust uste binen yerler koyulasir.
             shape = ".")       # shape = ".": Nokta seklini igne ucu gibi ufacik yapar ki kalabalik azalsin.

# Jitter (Titretme) ile ????z??m:
# iris verisindeki noktalar ust uste binmesin diye pozisyonlarini rastgele hafifce titretiriz.
j.fonk <- position_jitter(width = 1) # width=1: Titreme genisligini 1 birim olarak ayarladik.
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species)) +
  geom_point(position = j.fonk) +    # Noktalari j.fonk kuraliyla kaydirarak cizer.
  labs(x = "Canak Yaprak Uzunlugu",  # labs: X ekseni ismini degistirir.
       y = "Canak Yaprak Genisligi", # labs: Y ekseni ismini degistirir.
       col = "Turler")               # labs: Renk aciklama kutusunun (legend) basligini degistirir.


# --- 2. S??TUN VE H??STOGRAM GRAF??KLER?? (geom_bar / geom_histogram) ---

# Histogram: Bir verinin frekans (sayi) dagilimini gosterir.
ggplot(mtcars, aes(mpg)) + 
  geom_histogram(binwidth = 2.75) # binwidth = 2.75: Her bir sutunun/araligin genisligini belirler.

# ..density.. : Y eksenini "kac adet" oldugu yerine, "yuzdelik yogunluk" (density) olarak gosterir.
ggplot(mtcars, aes(mpg)) + 
  geom_histogram(aes(y = ..density..), # Y eksenini yogunluk fonksiyonuna bagladik.
                 binwidth = 2.75,      # Sutun genisligi
                 fill = "blue")        # fill: Sutunlarin "icini" maviye boyar.

# Bar Plot (S??tun Grafi??i) Pozisyonlari (am vites turune gore silindir sayimi)
ggplot(mtcars, aes(x=cyl, fill = factor(am))) + geom_bar(position = "stack") # stack: Sutunlari ust uste yigar.
ggplot(mtcars, aes(x=cyl, fill = factor(am))) + geom_bar(position = "fill")  # fill: Sutunlari %100'luk oranla doldurur.
ggplot(mtcars, aes(x=cyl, fill = factor(am))) + geom_bar(position = "dodge") # dodge: Sutunlari yan yana, hizali dizer.

# Dodge araligini manuel ayarlamak icin:
bindir <- position_dodge(0.6) # Sutunlarin arasindaki boslugu 0.6 yaptik.
ggplot(mtcars, aes(x=cyl, fill = factor(am))) + geom_bar(position = bindir)


# --- 3. ????ZG?? GRAF??KLER?? (geom_line) VE ZAMAN SER??S?? ---

# ??ssizlik (unemploy) verisini nufusa (pop) bolup oran cizgisi cekiyoruz.
ggplot(economics, aes(x=date, y = unemploy/pop)) + 
  geom_line() # Cizgi cizer, genelde zaman (date) verisi icin kullanilir.

# ChickWeight verisi: Her civcivin (Chick) gelisimini ayri ayri cizmek icin "group" kullaniriz.
ggplot(ChickWeight, aes(Time, weight, group = Chick, color=Diet)) +
  geom_line() +                 # Her civciv icin ayri bir cizgi cekti.
  geom_smooth(lwd = 2,          # lwd = 2: Genel trend/egilim cizgisini kalin cizer.
              se = F)           # se = F: Trend cizgisinin etrafindaki gri guven araligini kaldirir.



# ==============================================================================
# ??K??NC?? B??L??M: GGPLOT2 ??ZEL FONKS??YONLAR ( Logaritmik ??l??ek, Stat_Smooth )
# ==============================================================================

# mammals (memeliler) verisinde degerler arasinda ucurum vardir (ornek: fare vs fil).
# Bu buyuk farklari grafikte ezmek ve okunakli kilmak icin logaritma alinir.
ggplot(mammals, aes(x=body, y=brain)) +
  geom_point(alpha = 0.6) +       # alpha = 0.6 ile saydamlik eklendi.
  coord_fixed() +                 # coord_fixed: X ve Y eksen oranlarini sabitler, grafik sunmez.
  scale_x_log10() +               # X eksenindeki degerleri 10 tabaninda logaritmik yapar.
  scale_y_log10() +               # Y eksenindeki degerleri 10 tabaninda logaritmik yapar.
  stat_smooth(method = "lm",      # method="lm": Dogrusal (Linear Model) bir regresyon cizgisi ceker.
              col = "red",        # Trend cizgisinin rengini kirmizi yapar.
              se = T)             # se = T: Cizginin etrafina standart hata (guven) bulutunu ekler.

# Faktorlestirme (Kategorik Algilatma)
# cyl (silindir) sayisal bir degerdir (4, 6, 8). R bunu surekli veri sanmasin diye factor() kullaniriz.
ggplot(mtcars, aes(x=wt, y=mpg, col=factor(cyl))) + 
  geom_point(shape = 1, size = 4) # shape = 1: Ici bos yuvarlak, size = 4: Normalden buyuk yapar.

# Metin ekleme (geom_text): Yuvarlaklar yerine direkt faktor isimleri (etiketler) basilir.
ggplot(mtcars, aes(wt, mpg, label=factor(cyl))) + 
  geom_text() # Nokta koymak yerine label (etiket) neyse onu grafikte yazar.



# ==============================================================================
# ??????NC?? B??L??M: BASE R GRAF??KLER?? VE ??NCE AYARLAR ( Boyut, Font, Renk )
# ==============================================================================

# Notlardaki ozel veri setini kullanima hazirlayalim (Faktorlestirme Islemleri)
# attach(LungCapData_1_) # Veri setini aktif etmek icin kullanilir (Veri sizde yukluyse basindaki # isaretini silin)

# Egitim amacli asagidaki satirlarin calismasi adina, notlarinizdaki LungCap degiskeni 
# yerine R'daki ornek mtcars degiskenlerini kullaniyoruz. 
# Age = wt (Agirlik), LungCap = mpg (Yakit Tuketimi) olarak okuyabilirsiniz.
Age <- mtcars$wt
LungCap <- mtcars$mpg
Height <- mtcars$hp
Smoke <- as.factor(ifelse(mtcars$am == 1, "yes", "no")) # factor() yaparak kategorik hale getirdik.


# --- 1. CEX (BOYUT) VE FONT (YAZI T??P??) AYARLARI ---
# Notlarda belirtilen u?? grafik t??r?? yaklasimiyla her ayari tek bir grafikte gosteriyoruz.

plot(Age, LungCap, 
     main = "Scatterplot",     # main: Grafigin ana basligi
     las = 1,                  # las = 1: Y ekseni yazilarini dikeyden yataya cevirir.
     
     # CEX (Boyut) Carpanlari: 1 normaldir, 1.5 yuzde 50 buyuktur, 0.75 yuzde 25 kucuktur.
     cex = 1.5,                # cex: Icindeki NOKTALARIN boyutunu ayarlar.
     cex.main = 3,             # cex.main: Sadece ANA BASLIGIN boyutunu ayarlar.
     cex.lab = 1.25,           # cex.lab: EKSEN ISIMLERININ boyutunu ayarlar.
     cex.axis = 0.75,          # cex.axis: Eksen uzerindeki SAYILARIN boyutunu ayarlar.
     
     # FONT (Yazi Tipi) Carpanlari: 1=Normal, 2=Kalin(Bold), 3=Italik, 4=Kalin Italik.
     font.main = 2,            # font.main: Ana basligi kalin yapar.
     font.lab = 3,             # font.lab: Eksen isimlerini italik yapar.
     font.axis = 4,            # font.axis: Eksen sayilarini kalin italik yapar.
     
     # COL (Renk) Ayarlari: 2=Kirmizi, 3=Yesil, 4=Mavi veya direkt yazisi ("pink").
     col = "orange",           # col: Noktalarin rengini turuncu yapar.
     col.main = "purple",      # col.main: Ana basligin rengini mor yapar.
     col.lab = "pink",         # col.lab: Eksen isimlerini pembe yapar.
     col.axis = "Navy")        # col.axis: Eksen sayilarini lacivert yapar.


# --- 2. ????ZG??LER (abline) VE MET??NLER (text, mtext) EKLENMES?? ---

# abline: Duz referans cizgileri ceker.
abline(h = mean(LungCap),      # h: Yatay (Horizontal) cizgi ceker. mean(LungCap) ile ortalamaya hizaladik.
       col = 2,                # col = 2: Kirmizi renk.
       lwd = 2)                # lwd = 2: Cizgi kalinligini 2 yapar.

abline(v = mean(Age),          # v: Dikey (Vertical) cizgi ceker. Yasin ortalamasina hizaladik.
       col = 5,                # col = 5: Acik mavi renk.
       lwd = 4)                # lwd = 4: Cizgiyi epey kalin (4) yapar.

# text: Grafigin ICINE yazi yazar.
text(x = 2.5, y = 8.5,         # Hangi x ve y koordinatina yazacagini sectik.
     label = "r=0.82",         # Ekrana basilacak yazi.
     adj = 0,                  # adj = 0: Yaziyi sola yaslar (1 yazsaydik saga yaslardi).
     cex = 1.5,                # cex = 1.5: Yaziyi %50 buyutur.
     col = 4,                  # col = 4: Yaziyi mavi yapar.
     font = 4)                 # font = 4: Yaziyi kalin italik yapar.

# mtext (Margin Text): Grafigin kenar bosluklarina (CERCEVESINE) disaridan yazi yazar.
mtext(text = "r=0.85",         # Yasilacak yazi.
      side = 3,                # side = 3: Grafigin UST dis kenarina yazar (1=Alt, 2=Sol, 3=Ust, 4=Sag).
      adj = 1,                 # adj = 1: Saga dogru yaslar.
      col = 4,                 # Renk mavi.
      cex = 1.25,              # Boyut ayarlamasi.
      font = 4)                # Kalin italik.


# --- 3. A??IKLAMA KUTUSU (legend) VE ??K??NC?? VER?? (points, lines) ---

# Sadece Sigara icmeyenleri (Smoke == "no") mavi renk (col=4) ve dolu yuvarlak (pch=16) ile cizdik.
plot(Age[Smoke == "no"], LungCap[Smoke == "no"], 
     main = "Lungcap vs Age", 
     xlab = "Age", ylab = "Lungcap", 
     col = 4, pch = 16)

# points: Acik olan grafige yeni bir katman/veri ekler (Sigara icenleri ekliyoruz).
points(Age[Smoke == "yes"], LungCap[Smoke == "yes"], 
       col = 2,                # col = 2: Icenleri kirmizi yaptik.
       pch = 17)               # pch = 17: Icenlerin sekli ici dolu UCGEN oldu.

# lines ve smooth.spline: Noktalarin arasindan kavisli bir "d??zle??tirme" cizgisi gecirir.
lines(smooth.spline(Age[Smoke=="no"], LungCap[Smoke=="no"]), col=4) # Icilmeyenlerin mavi kavisli trendi.
lines(smooth.spline(Age[Smoke=="yes"], LungCap[Smoke=="yes"]), col=2) # Icenlerin kirmizi kavisli trendi.

# legend: Hangi rengin ne anlama geldigini gosteren bilgi kutusunu ekler.
legend(x = 3.5, y = 14,        # Kutunun x ve y koordinati.
       legend = c("Non-Smoke", "Smoke"), # Kutudaki yazilar.
       col = c(4, 2),          # Iki grup icin sirasiyla renkler (4=Mavi, 2=Kirmizi).
       pch = c(16, 17),        # Iki grup icin sirasiyla sekiller (16=Yuvarlak, 17=Ucgen).
       bty = "n")              # bty = "n": (Box Type = None) Kutunun etrafindaki siyah cerceveyi gizler.


# --- 4. KUTU GRAF?????? (boxplot) ??NCE AYARLARI ---

# boxplot: Ceyreklikleri ve aykiri degerleri gosterir.
boxplot(LungCap, 
        main = "Boxplot",      # Ana baslik.
        ylab = "Lung Cap",     # Y ekseni etiketi.
        ylim = c(0, 40),       # ylim: Y eksenini 0 ile 40 arasina kilitleyerek grafigin olcegini sabitler.
        las = 1)               # las = 1: Y eksenindeki rakamlari yan yatarak okumasi kolay hale getirir.

boxplot(LungCap ~ Smoke)       # Tilda (~) isareti: "Sigara icme durumuna GORE akciger kapasitesini dagit" demek.



# ==============================================================================
# D??RD??NC?? B??L??M: TANIMLAYICI ??STAT??ST??KLER (Verinin Anatomisini Cikarmak)
# ==============================================================================
# Grafigi cizmeden once veya sonra verinin matematiksel arkaplanina bakmak icin.

table(Smoke)            # Kategorik verilerin kac adet oldugunu sayar (Kac kisi icen, kac kisi icmeyen).
length(Smoke)           # Toplam kac adet gozlem / satir oldugunu soyler.

mean(LungCap)           # Aritmetik ortalamayi verir.
mean(LungCap, trim=0.10)# trim = 0.10: Kesikli ortalama yapar. Bastaki ve sondaki %10'luk aykiri kismi atip oyle ortalama alir.
median(LungCap)         # Medyan (Ortanca) degeri bulur. Seriyi siraya dizer, tam ortadakini alir.

var(LungCap)            # Varyans: Verilerin ortalamadan ne kadar uzaklara dagildigini gosterir.
sd(LungCap)             # Standart Sapma: Varyansin karekokudur ( sqrt(var) ile aynidir ).

min(LungCap)            # Serideki en kucuk degeri verir.
max(LungCap)            # Serideki en buyuk degeri verir.
range(LungCap)          # Verinin en kucuk ve en buyuk degeri arasindaki kapiyi/araligi soyler.
quantile(LungCap)       # Ceyreklikleri (%0, %25, %50, %75, %100) dilimler halinde verir. Boxplot'un sayisal halidir.

sum(LungCap)            # Serideki tum degerleri birbiriyle toplar.
cov(LungCap, Age)       # Kovaryans: Iki degiskenin (LungCap ve Age) birlikte nasil degistigini olcer.
cor(Age, LungCap)       # Korelasyon: Iki degisken arasindaki iliskinin gucunu (0 ile 1 arasi) olcer.

summary(mtcars)         # summary: Icine atilan verinin min, max, ceyreklikler, ortalama dahil TUM ozetini tek kalemde ekrana basar.