

# GOREV 1
# 3 farkli ogrencinin 4 haftalik istatistik calisma saatlerini tutan 3 ayri vektor olustur.
# Vektorlerin icindeki saatleri tamamen kendin salla (orn: 2, 5, 4, 6).
# Sonra bu 3 vektoru satir satir alt alta (rbind) birlestirip 'calisma_matrisi' adinda bir matris yap.
ahmet <- c(14,21,23,9)
mehmet <- c(11,12,16,17)
samet <- c(8,3,6,40)

mesai_matris <- rbind(ahmet,mehmet,samet)


# GOREV 2
# Olusturdugun bu matris su an isimsiz. 
# Matrisin satir isimlerine (rownames) ogrenci isimlerini ata ("Ahmet", "Mehmet", "Ayse").
# Sutun isimlerine (colnames) ise haftalari ata ("Hafta1", "Hafta2", "Hafta3", "Hafta4").
rownames(mesai_matris) <- c("Ahmet","Mehmet","Samet")
colnames(mesai_matris) <- c("ilk_hafta","ikinci_hafta","ucuncu_hafta","final_haftasi")

# GOREV 3 
# ??ndeksleme (veri cekme) zamani.
# Matrisin icinden sadece Mehmet'in (yani 2. satirin) tum haftalarini cekip ekrana yazdir.
# Ardindan, Samet'nin sadece 3. haftadaki (yani 3. satir, 3. sutun) calisma saatini cek.
mesai_matris[2,] # <- mehmetin tum haftalari
mesai_matris[3,3] # <- sametin 3. /haftasi

# GOREV 4 
# Matematiksel islem ve filtreleme.
# Sinavlar yaklastigi icin herkesin calisma saatine +2 saat ekle ve matrisi oyle guncelle.
# Guncellenmis matrisin uzerinde mantiksal bir sinama yap: Sadece finalde calisma saati 8'den buyuk ve esit (>=) olanlari ekrana bastir.
mesai_matris <- mesai_matris + 2  
mesai_matris[mesai_matris[, "final_haftasi" ] >= 8,"final_haftasi"]

# GOREV 5 (BOSS SEV??YES??)
# Her ogrencinin 4 haftalik "Toplam" calisma saatini hesaplayan bir kod yaz ('rowSums' komutunu arastirabilirsin).
# Cikan bu toplam degerlerini yeni bir vektore ata.
# Son olarak, bu yeni vektoru 'cbind' komutu ile matrisin en sagina yeni bir sutun ("Toplam") olarak yap

# Ad??m 1: Sat??rlar?? (????rencilerin 4 haftal??k mesailerini) toplay??p yeni bir vekt??re ata.
# rowSums fonksiyonu, i??ine ald?????? matrisin sat??rlar??n?? soldan sa??a toplar.
toplam_mesai <- rowSums(mesai_matris)

# Ad??m 2: ????kan bu toplam vekt??r??n??, 'cbind' (Column Bind - S??tun Ba??lama) ile 
# matrisin en sa????na "Toplam" ad??nda yeni bir s??tun olarak yap????t??r ve matrisi g??ncelle.
mesai_matris <- cbind(mesai_matris, Toplam = toplam_mesai)
