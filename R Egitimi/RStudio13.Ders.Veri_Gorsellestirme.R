# Temel seviye R egitimi on ucuncu ders 


# ~~~~~~~~( Veri Gorsellestirmeye Giris: Base R Grafikleri )~~~~~~~~~~

# Aradan zaman gecmis veya RStudio'yu yepyeni acmis olabilirsiniz. 
# Bu yuzden hicbir veriyi onceden cektigimizi varsaymiyoruz, her seye sifirdan basliyoruz!
# Bugun verileri gorsellestirmeye basliyoruz. Cizecegimiz grafiklerde 
# her bir komutun ekranda neyi degistirdigini "adim adim" gorecegiz.

data(mtcars) # R'in icindeki hazir araba verisini aktif ettik
head(mtcars) # Ilk 6 satira baktik



# ==============================================================================
# B??R??NC?? B??L??M: HISTOGRAM ( hist ) -> Dagilimi Adim Adim Insa Etmek
# ==============================================================================

# Adim 1: Hicbir parametre girmeden, en cirkin ve yalin haliyle cizelim.
hist(mtcars$hp)

# Adim 2: Makyaj yapalim! Renk, sinirlar ve basliklar ekliyoruz.
hist(mtcars$hp, 
     main = "Arabalarin Beygir Gucu Dagilimi", # main: Grafigin en tepesindeki ana basliktir.
     xlab = "Beygir Gucu (HP)",                 # xlab: X ekseninin altina yazilacak etikettir.
     ylab = "Frekans",                          # ylab: Y ekseninin yanina yazilacak etikettir.
     col = 5,                                   # col (Color): Sutunlarin ICINI boyar. (5 = Acik Mavi)
     border = "darkblue",                       # border: Sutunlarin DIS cercevesini cizer. (Bitisik durmasinlar diye)
     xlim = c(50, 400),                         # xlim: X ekseninin gosterecegi minimum ve maksimum araligi kilitler.
     las = 1)                                   # las: Y eksenindeki sayilari dikeyden YATAY konuma cevirir.

# Adim 3: Tuvale yazi (text) yazalim! 
text(x = 300, 
     y = 4, 
     labels = "Canavarlar \nBurada ->",         # \n isareti alt satira gecmek (Enter'a basmak) demektir.
     col = "red",                               # Yazinin rengini kirmizi yapar.
     cex = 0.9)                                 # cex (Character Expansion): Yaziyi normalden bir tik (0.9) ufaltir.



# ==============================================================================
# ??K??NC?? B??L??M: KUTU GRAFIGI ( boxplot ) -> Adim Adim Gelisim
# ==============================================================================

# Adim 1: En sade haliyle yakit tuketimi (mpg) kutusu. Cok renksiz.
boxplot(mtcars$mpg)

# Adim 2: Y ekseninin sinirlarini (ylim) degistirerek kutuyu s??k??stiralim.
boxplot(mtcars$mpg, 
        main = "Yakit Tuketimi (MPG) Kutu Grafigi",
        ylab = "Mil / Galon",
        col = 3,                                # col (Color): Kutunun ICINI yesile boyar. (3 = Yesil)
        ylim = c(0, 45),                        # ylim: Y eksenini 0'dan baslatip 45'te bitirerek kutuyu ortalar.
        las = 1)                                # las: Sayilari yatay yapar, okumasi kolaylasir.

# Adim 3: Aykiri deger (Outlier) olusursa diye grafikte tepeye bir yazi birakalim.
text(x = 1, y = 40, labels = "Eger burada nokta olsaydi,\no bir aykiri deger olurdu!", col = "blue")



# ==============================================================================
# ??????NC?? B??L??M: SACILIM GRAFIGI ( plot ) -> Degisimi Canli Canli Izleyin!
# ==============================================================================

# Adim 1: Hicbir ekstra komut yok. Sadece X ve Y. 
plot(x = mtcars$hp, y = mtcars$mpg)

# Adim 2: Basliklari ve eksenleri duzeltelim. (Ekranda degisimi izleyin)
plot(x = mtcars$hp, y = mtcars$mpg, 
     main = "Beygir Gucu ve Yakit Tuketimi Iliskisi",
     xlab = "Beygir Gucu (HP)",
     ylab = "Yakit Tuketimi (MPG)")

# Adim 3: Eksenleri uzatalim (xlim, ylim) ve yazilari yatay yapalim (las).
plot(x = mtcars$hp, y = mtcars$mpg, 
     main = "Beygir Gucu ve Yakit Tuketimi Iliskisi",
     xlab = "Beygir Gucu (HP)",
     ylab = "Yakit Tuketimi (MPG)",
     xlim = c(50, 350), 
     ylim = c(5, 40),
     las = 1)

# Adim 4: Noktalarin kiyafetlerini degistirelim! 
plot(x = mtcars$hp, y = mtcars$mpg, 
     main = "Beygir Gucu ve Yakit Tuketimi Iliskisi",
     xlab = "Beygir Gucu (HP)",
     ylab = "Yakit Tuketimi (MPG)",
     xlim = c(50, 350), 
     ylim = c(5, 40),
     las = 1,
     pch = 15,                                  # pch (Point Character): Nokta sekli. 15 = Ici dolu KARE yapar.
     cex = 1.5,                                 # cex: Boyut carpani. Kareleri normal boyutunun 1.5 katina cikarir.
     col = 6)                                   # col: Rengi 6 numara yani Mor/Pembe (Magenta) yapar.



# ==============================================================================
# D??RD??NC?? B??L??M: CIZGI VE YAZI EKLEME ( abline & text ) -> Final Dokunusu
# ==============================================================================
# UYARI: Bu komutlar en son cizilen plot acikken calisir. Yeni plot cizmez, 
# var olanin uzerine katman atar.

# Modellerle falan isimiz yok. Sahnemize manuel olarak istedigimiz hizadan duz referans cizgileri cekelim:
# h = horizontal (yatay), v = vertical (dikey)

# 1. Y ekseninde 20 hizasindan yatay bir referans cizgisi cekelim:
abline(h = 20,                                  # h: Yatay (Horizontal) hizasini belirler.
       col = 4,                                 # col: Cizgiyi 4 numarali renge (Mavi) boyar.
       lwd = 4,                                 # lwd (Line Width): Cizgi kalinligi. Cizgiyi 4 kat kalinlastirir.
       lty = 5)                                 # lty (Line Type): Cizgi tipi. 5 = Uzun kesik cizgilerden olusturur.

# 2. X ekseninde 200 hizasindan asagi dikey bir sinir cizgisi cekelim:
abline(v = 200,                                 # v: Dikey (Vertical) hizasini belirler.
       col = 2,                                 # col: 2 numara yani Kirmizi.
       lwd = 3,                                 # lwd: 3 kat kalin.
       lty = 2)                                 # lty: 2 = Klasik kesik cizgi.

# Son olarak bos bir alana cikan sonucu text ile yaziyoruz:
text(x = 260, y = 35, 
     labels = "200 beygiri gecenler\nsag tarafta kaliyor!", 
     col = 1,                                   # col: Yaziyi 1 numarali renge (Siyah) boyar.
     cex = 1.2)                                 # cex: Yaziyi yuzde 20 (1.2) buyutur.



# ==============================================================================
# BE????NC?? B??L??M: ??OKLU GRAF??K V??TR??N?? ( par(mfrow) ) -> Ekran?? B??lmek
# ==============================================================================
# Bazen birden fazla grafigi yan yana veya alt alta kiyaslamak isteriz.
# Bunun icin paneli "par" (parameters) ve "mfrow" (multi-figure row) ile boleriz.

# 1. Paneli ACIYORUZ (Izgara Olusturma):
# Ekrani 2 satir, 2 sutun (toplam 4 grafiklik) bir tabloya bolelim:
par(mfrow = c(2, 2))

# Simdi ard arda 4 tane basit grafik cizdirelim, hepsi ayni ekranda kendi odasina yerlesecek:
hist(mtcars$hp, col = 2, main = "1. Histogram")
boxplot(mtcars$mpg, col = 3, main = "2. Boxplot")
plot(mtcars$wt, mtcars$mpg, col = 4, pch = 16, main = "3. Scatter Plot")
plot(mtcars$hp, mtcars$qsec, col = 6, pch = 17, main = "4. Baska Bir Plot")

# 2. Paneli KAPATIYORUZ (Fabrika Ayarlarina Donus):
# Isimiz bittiginde, bundan sonra cizecegimiz grafikler kucucuk kalmasin diye 
# ekrani tekrar 1 satir, 1 sutun (tam ekran) haline geri dondurmeliyiz.
par(mfrow = c(1, 1))

# (Alternatif olarak sadece dev.off() yazarak da tum grafik gecmisini temizleyip ekran bolmesini sifirlayabilirsiniz.)



# ------------------------------------------------------------------------------
# ???? ANALYST ROADMAP KOPYA KAGIDI (CHEAT SHEET)
# ------------------------------------------------------------------------------
# --- col (Renk Kodlari) ---
# 1 = Siyah (Varsayilan)
# 2 = Kirmizi
# 3 = Yesil
# 4 = Mavi
# 5 = Acik Mavi (Turkuaz)
# 6 = Mor / Pembe (Magenta)
# 7 = Sari
# 8 = Gri
# (Not: Sayilar yerine direkt "red", "blue", "yellow" vb. de yazabilirsiniz)
#
# --- pch (Nokta Sekilleri) ---
# 0  = Ici Bos Kare
# 1  = Ici Bos Yuvarlak (Varsayilan)
# 2  = Ici Bos Ucgen
# 3  = Arti Isareti (+)
# 4  = Carpi Isareti (X)
# 8  = Yildiz (*)
# 15 = Ici Dolu Kare
# 16 = Ici Dolu Yuvarlak
# 17 = Ici Dolu Ucgen
#
# --- lty (Cizgi Tipleri) ---
# 0 = Gorunmez (Blank)
# 1 = Duz Cizgi (Solid - Varsayilan) 
# 2 = Kesik Cizgi (Dashed) -> Genelde guven araliklari icin.
# 3 = Noktali Cizgi (Dotted) -> Eksen hizalari / referanslar.
# 4 = Nokta-Kesik (Dotdash)
# 5 = Uzun Kesik (Longdash)
# 6 = Cift Kesik (Twodash)
# ------------------------------------------------------------------------------