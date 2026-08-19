# Temel seviye R egitimi on ikinci ders 


# ~~~~~~~~( Veri Manipulasyonunun Krali: dplyr Paketi )~~~~~~~~~~

# Gecmis derslerde verileri secmeyi, kosul yazmayi ve filtrelemeyi "Saf R" (Base R)
# ile yapmayi ogrendik. Ornegin koseli parantezler [] ve $ isaretleriyle bogusuyorduk.
# Ancak veriler buyudukce bu yontem iskenceye donusur. 

# Iste burada veri bilimcilerin en yakin dostu, "Veri Grameri" dedigimiz dplyr devreye girer!
# dplyr, kodlarimizi sanki Ingilizce bir cumle okuyormusuz gibi anlasilir kilar.

# 13. derste yukledigimiz dev tidyverse paketinin icinden sadece dplyr'i cagiriyoruz:
library(dplyr)

# Uzerinde calisacagimiz kucuk bir ekip/ogrenci tablosu yaratalim:
ekip_verisi <- data.frame(
  isim = c("Orcun", "Furkan", "Zehra", "Ahmet", "Veli", "Ayse"),
  bolum = c("Ekonometri", "Yazilim", "Yazilim", "Yazilim", "Ekonometri", "Istatistik"),
  vize = c(85, 70, 95, 65, 45, 90),
  final = c(95, 80, 100, 75, 55, 95),
  spor_gecmisi = c("Var", "Yok", "Var", "Yok", "Var", "Yok")
)

ekip_verisi
# Data Frame'imiz hazir. Simdi dplyr'in 5 Efsanevi Fiili ile sov yapalim.
# NOT: Tum islemlerde orijinal Pipe ( %>% ) operatorunu kullanacagiz!



# ==============================================================================
# 1. filter() -> Satirlari Filtreleme (Kosul Belirtme)
# ==============================================================================
# Excel'deki "Filtre" dugmesinin kod halidir. Istedigimiz sarti saglayan satirlari getirir.

# Sadece Ekonometri bolumundeki ogrencileri getir:
ekip_verisi %>% 
  filter(bolum == "Ekonometri")

# Vize notu 80'den buyuk VE spor gecmisi olanlari getir:
ekip_verisi %>% 
  filter(vize > 80 & spor_gecmisi == "Var")



# ==============================================================================
# 2. select() -> Sutunlari Secme veya Cikarma
# ==============================================================================
# 100 sutunluk bir veride sadece isinize yarayan 3 sutunu cekmek icin kullanilir.

# Sadece isim ve final notlarini gorelim:
ekip_verisi %>% 
  select(isim, final)

# "bolum" sutunu HARIC her seyi getir (Basina eksi '-' koymamiz yeterli):
ekip_verisi %>% 
  select(-bolum)



# ==============================================================================
# 3. arrange() -> Siralama Yapma
# ==============================================================================
# Excel'deki "A'dan Z'ye sirala" mantigidir.

# Vize notuna gore kucukten buyuge sirala:
ekip_verisi %>% 
  arrange(vize)

# Final notuna gore BUYUKTEN KUCUGE sirala (desc = descending/azalan):
ekip_verisi %>% 
  arrange(desc(final))



# ==============================================================================
# 4. mutate() -> Yeni Sutun Olusturma veya Guncelleme
# ==============================================================================
# Mevcut verileri kullanarak yepyeni matematiksel sutunlar uretmek icin kullanilir.

# Gecme notunu hesaplayalim (Vizenin %40'i, Finalin %60'i):
# Ve bu sonucu "gecme_notu" adinda YENI bir sutuna atayalim:
guncel_tablo <- ekip_verisi %>% 
  mutate(gecme_notu = (vize * 0.4) + (final * 0.6))

guncel_tablo
# Tablonun en sagina baktiginizda hesaplanmis yepyeni bir sutun goreceksiniz!



# ==============================================================================
# 5. group_by() ve summarize() -> Gruplama ve Ozetleme (OLUMCUL KOMBOS)
# ==============================================================================
# Ekonometride ve veri analizinde en cok kullanacaginiz ikilidir. 
# "Bolumlere gore ortalama notlar nedir?" gibi kategorik sorularin cevabini verir.

# Ekipteki ogrencileri "bolum"lerine gore grupla, sonra bu gruplarin vize ortalamasini bul:
ekip_verisi %>% 
  group_by(bolum) %>% 
  summarize(ortalama_vize = mean(vize))

# Ciktida Ekonometri, Istatistik ve Yazilim bolumlerinin tek tek ortalamalarini gorursunuz.



# ==============================================================================
# GRAND FINALE: Zincirleme Kod Yazimi (Selale Mantigi)
# ==============================================================================
# Pipe ( %>% ) operatorunun asil gucunu simdi goreceksiniz. 
# Birden cok dplyr fiilini alt alta baglayarak tek bir nefeste harikalar yaratabiliriz.

# SENARYO: Sadece "Yazilim" bolumundeki ogrencileri al,
# Final notlarina gore buyukten kucuge sirala,
# Sadece isim ve final notu sutunlarini ekranda goster!

ekip_verisi %>% 
  filter(bolum == "Yazilim") %>% 
  arrange(desc(final)) %>% 
  select(isim, final)

# Iste bu kadar! Ic ice gecmis, okumasi imkansiz parantez yiginlari yerine,
# yukaridan asagiya dogru cumle gibi okunan gercek bir analist kodu yazdik.