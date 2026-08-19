library(dplyr)


# GOREV 1
# Bir veri seti olusturup icine karakter,mantik ve sayisal sutunlar ekle.
# her sutunun ve veri setinin bir ismi olsun.
b311_oda_arkadaslari <-  data.frame( 
  isim = c("qyrcyn","scarface","dba","mitci"),
  uyku_saati = c(7,7,8,10),
  alan =  c("data_science","developer","developer","developer"),
  proje_saati = c(7,6,5,4),
  spora_gitti = c(TRUE,FALSE,FALSE,FALSE)
  )

# GOREV 2
# Veri setinde alani developer olanlarin sadece proje saatleri ve isminin gozukmesini istiyorum.
b311_oda_arkadaslari %>% 
  filter(alan == "developer" ) %>%
  select(proje_saati,isim)

# GOREV 3 
# Veri setine uretkenlik isminde bir sutun ekle ve icine uyelerin uyku saatiyle proje 
# saatinin carpimini koy, hemen ard??ndan bu veri setini uretkenlige gore buyukten kucuge sirala

b311_oda_arkadaslari %>%
  mutate(uretkenlik = proje_saati*uyku_saati) %>%
  arrange(desc(uretkenlik))

# GOREV 4 
# Veri setini alanlarina gore grupla, ardindan alan ortalamasi diye ayri bir sutun ac ve 
# alanlarin ortalamasini oraya yazdir.
# ustelik ciktida sadece isim, proje saati ve mesai ortalamasi gozuksun.

b311_oda_arkadaslari %>%
  group_by(alan) %>%
  mutate(mesai_ortalamasi = mean(proje_saati)) %>%
  select(mesai_ortalamasi,proje_saati,isim)
  