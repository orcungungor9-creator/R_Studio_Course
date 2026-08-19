# Temel seviye R egitimi onuncu ders 


# ~~~~~~~~( Kutuphaneler & Acik Kaynak Mantigi ve  CRAN )~~~~~~~~~~

# R programlama dili, parayla satilan siradan bir yazilim degildir; 
# "Acik Kaynak Kodlu" (Open Source) bir dildir. Peki bu ne demek?

# 1. Acik Kaynak (Open Source) Ne Demektir?
# R tamamen ucretsizdir ve tum dunyadaki bilim insanlarinin, istatistikcilerin 
# ve yazilimcilarin gonullu olarak gelistirdigi bir sistemdir.
# Avantaji sudur: R'i ureten sirketin yeni bir ozellik getirmesini beklemezsin. 
# Japonya'daki bir genetikci veya Amerika'daki bir finansci kendi isini 
# inanilmaz kolaylastiran bir kod (paket) yazar ve bunu tum dunyayla bedava paylasir. 

# 2. CRAN Nedir? (The Comprehensive R Archive Network)
# Yukarida bahsettigimiz o "gonullu" insanlarin yazdigi kodlar oyle internette
# basibos dolasmaz. CRAN, R'in resmi, guvenilir ve virus taramasindan gecmis 
# devasa "App Store"udur (Uygulama Magazasi). 
# R'a yepyeni bir yetenek eklemek istediginizde bu paketler otomatik 
# olarak CRAN sunucularindan guvenle indirilir.

# 3. Paket (Package) Nedir?
# Icerisinde hazir komutlar, isinize yarayacak ozel fonksiyonlar barindiran,
# R'in yeteneklerini arsa cikaran alet cantalaridir.


# ~~~~~~~~( Veri Manipulasyonunun Krali: 'dplyr' Paketi )~~~~~~~~~~

# Bugun R'in en unlu, en cok kullanilan paketini indirecegiz: dplyr.
# Neden dplyr? Eger elinizde binlerce satirlik koca bir tablo (Data Frame) varsa;
# icinden istediginiz satirlari filtrelemek, sadece belli sutunlari cekip almak 
# veya tablolari birlestirmek normal R kodlariyla (Base R) eziyettir.
# dplyr paketi bu islemleri adeta bir oyuncak gibi kolaylastirir.

# --(UYARI)--
# Arkadaslar ben su anki tum paket islemlerini tamamen gostermelik koydum. 
# Hepsini ayni anda calistirmayin sakin. Hata alirsiniz cogu yerde ve akliniz karisir.
# komutlari ogrenin yeter calistirip hatalar dizisi ile karsilasmayin, komutlari ogrenirseniz
# ilerleyen derslerde bu uc kutuphanenin icine biraz bakacagiz zaten, denerken kullanirsiniz.


# --- Adim 1: Paketi Indirmek (install.packages) ---
# Bu islem telefona App Store'dan (CRAN'dan) uygulama indirmek gibidir. 
# Bilgisayariniza SADECE BIR KERE YAPILIR! Silmedikce orda kalir.
# DIKKAT: Indirirken paket ismi mutlaka TIRNAK ICINDE (" ") yazilmalidir.
# Eger paket sizde varsa bu satiri calistirmak yerine basina # koyun. 
 install.packages("dplyr") 
 install.packages("ggplot")
 install.packages("readxl")




# --- Adim 2: Paketi Aktif Etmek ve Kapatmak (library) ---
# Uygulamayi telefona indirdiniz ama kullanmak icin uzerine tiklayip acmaniz lazim!
# library() komutu, onceden indirdiginiz o paketi "o anki" calismanizda kullanima acar. 
# R'i her kapatip actiginizda (yeni bir projeye basladiginizda) tekrar cagirmalisiniz.
# DIKKAT: library ile cagirirken tirnak isaretine GEREK YOKTUR!
library(dplyr) 

# Yuklu olan tum paketlerinizi listelemek icin library() komutu kullanilir.
library()

# Bir paketin icinde hangi komutlar var merak ediyorsan komutu ile help kismindan
# paket icerigine bakabilirsin.
help(package = "dplyr") 




# --- Adim 3: Birden fazla paketle calismak ve Masking sorunu --- 

# Ayni Anda Kac Paket Kullanilir? Istediginiz kadar.
# Buyuk bir projede tek paket yetmez, bazen 10-15 paketi ayni anda acariz.

# Not: Bu paketleri ileriki derslerde indirip kuracagiz simdilik kurmayin.
# R'da projeyi bir insaat (santiye) gibi dusunun:
library(readxl)  # Hamal ustayi cagirdik (Veriyi bilgisayardan iceri tasir)
library(dplyr)   # Marangoz ustayi cagirdik (Veriyi keser, bicer, temizler)
library(ggplot2) #Boyaci ustayi cagirdik (Veriyi boyar, grafik cizer)
# Bu ustalarin hepsi ayni anda projenizde (santiyede) calisabilir.


# ~~~~~~~~( Paketi Kapatmak (detach) ve Isim Cakismasi )~~~~~~~~~~

# Madem hepsi ayni anda calisiyor, neden bir paketi kapatalim (detach)?
# Cunku bazen iki farkli usta, AYNI ISIMDE alet kullanir! 
# Buna R dilinde "Masking" (Isim Cakismasi- Maskeleme) denir.


# Ornegin: R'in kendi temelinde 'filter' (filtrele) diye bir komut vardir, 
# cagirdigimiz dplyr paketinin icinde de 'filter' diye bir komut vardir.
# Siz koda filter() yazinca R kafasi karisip sorar: "Hangi ustanin aletini kullanayim?"
# R genelde en son cagirdiginiz paketin komutunu gecerli sayar. 
# Bu durum kodunuzu veya eski hesaplamalarinizi bozuyorsa 2 cozum vardir:


# --- COZUM 1: Paketi Kapatmak (Ustayi Kovmak) ---
# Eger o paketle isiniz tamamen bittiyse ve diger komutlarla cakisip 
# ayaginizin altinda dolasmasini istemiyorsaniz onu projeden kovabilirsiniz:
# False yazarsak paketi uykuya alir, True yazarsak programin aktif hafizasindan cikarir.
detach("package:dplyr", unload=TRUE) #( paketi daha fazla kullanmayacaksak kapatir)
detach("package:dplyr", unload=FALSE)#( Paketi uykuya alir ama hafizada durur ve ram sisirir)
# Bu arada kapali paketi ayni sekilde library(paket ismi) seklinde tekrar cagirabiliriz.

# --- COZUM 2:(Iki kere Iki Nokta Ust Uste :: ) ---
# Paketi kapatmadan hangi ustanin hangi aletini kullanmak istiyorsaniz eger, komut olarak
# istediginizi "paket_adi::komut_adi" seklinde R'a direkt fisildarsiniz:

dplyr::filter()  #(Sadece dplyr'in filtresini kullan)
stats::filter()  #(R'in kendi orijinal filtresini kullan)

# Boylece kavga gurultu olmadan, detach yapmaya gerek kalmadan 
# butun paketleri ayni anda baris icinde calistirabilirsiniz!

# Bu arada diyelim ki 1000 satir kof yazdik, acik olan paketlerimizi merak ediyoruz.
# search() komutu bize acik olan kutuphaneleri listeler.(uykudaki ya da aktif olmayani gostermez.)

# ~~~~~~~~( Aktif ve Uyuyan Paketleri Gormek )~~~~~~~~~~

# R'da cagirdigimiz paketler (ustalar) iki farkli durumda olabilir: 
# 1. Sahada aktif calisanlar.
# 2. Arka planda uyuyanlar.

# 1. Sahada Calisanlari Gormek (search komutu):
# "Su an kimler aktif olarak is yapiyor, kimlerin aletini kullanabilirim?" 
# sorusunun cevabidir. Sadece 'library()' ile cagrilip aktif edilenleri gosterir.
search()

# NOT: detach(..., unload=FALSE) diyerek uykuya aldiginiz (arka plana ittiginiz) 
# paketler, sahada olmadiklari icin bu 'search()' listesinde GORUNMEZ.

# 2. Arka Planda Uyuyanlari Gormek (loadedNamespaces komutu):
# Iste R'in arka odasi, RAM'in (hafizanin) gercek yuzu burasidir!
# Sahada aktif calisan ustalar + arka planda yatan (uyuyan) tum ustalarin 
# TAM LISTESINI verir. Bilgisayarin hafizasini gercekte nelerin isgal ettigini 
# buradan anlarsiniz.
loadedNamespaces()

# Ozetin Ozeti:
# search()            -> Sadece goz onunde, meydanda olanlari listeler.
# loadedNamespaces()  -> uyuyani uyanigi hepsini listeler.




# --- Adim 4: Atifta bulunmak ---
#CRAN sitesinden de kontrol edilebilir ve proje bitiminde paketini kullandigimiz kisiyi
# atifta bulunuruz.
# atifta bulunma komutu, bu komut ile nasil atifta bulunacaginizi size gosterir.
citation("dplyr")
# Bu kodu yazdigimizda karsimiza iki metin cikacak @manual yazan metne kadar olan o ilk
# paragrafi direkt copy/paste yapabilirsiniz analiz dosyaniza.
# Diger kisim biraz daha profesyonel kismi oluyor isin, otomatik kaynakca kullananlar 
# icin yapilmis, bizi ilgilendirmedigi icin su anlik es geciyorum merak edenler ogrenebilir.




# --- Dipnot ---

# Paketleri calistirdiginizda konsolda kirmizi yazilar cikabilir, bazen bunun sebebi 'Masking'
# Yani daha once bahsettigim ayni isme sahip bir seyin(komut,atama,degisken vb..) cakismasidir.
# O uyaridan itibaren en guncel olani yani kutuphanedeki halini kullanir.

# RStudio'nun sag alt kosesindeki "Packages" sekmesine goz atin. 
# Orasi sizin cihazinizda yuklu olan tum paketlerin listesidir. 

# Yanindaki kutucugu tiklayarak da "library()" komutunu manuel yazmadan 
# o paketi hizlica aktif edebilirsiniz.

# Yine ayni sekilde aktif paketler kenardaki panelde yaninda tik ile gozukur.
 
# Yine ayni sekilde oradaki install kismindan da paket yuklenebilir.(Ben kodunu yazarim)
install.packages("dplyr")
# Ayrica paketi guncellemek icin de install kisminin yanindaki update kismini kullaniriz.
update.packages("dplyr") # Paketin yeni surumu ciktiysa gunceller.
