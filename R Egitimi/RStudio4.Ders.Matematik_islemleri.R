# Temel seviye R egitimi dorduncu ders 


# ~~~~~~~~( Temel Matematiksel Islemler )~~~~~~~~~~

# Ben iki degisken atayarak yaptim ama dilerseniz keyfinize gore yapin.
a <- 20
b <- 5


# Bu sekilde islemlerin sonuclarini da degiskenlere atayabilirsiniz. 
toplam <- a + b   # 25

fark <- a - b     # 15

carpim <- a * b   # 100

bolum <- a / b    # 4

tambolme <- a%/%3 # 6 (kalani atarak tam sonucu verir)

us <- b^2         # 25 (b uzeri 2)

us2 <-b**2        # 25 (b uzeri 2)

mod <- a%%3       # 2 (yalnizca kalani verir)


# islem oncelikleri ve dahasi icin;


2*8/4   # Carpma ve bolme ayni oncelige sahip oldugu icin R islemi soldan saga dogru yapar.

2*8+6   # Burada once carpmayi yapar, bolme olsa bolmeyi yapardi.

2*8+1/2 # Burada iki islemi de ayri ayri yapar ve sonra toplar(2*8)+(1/2) seklinde gorur

T+2     # Daha once bahsettigim gibi R programlama  dili icin True = 1 ve False = 0'dir. 

2*(8+1) # Bu sefer once parantezin icini toplar. R Evrensel kurallara tamamen uygundur. 


# Matematiksel islemler birer R fonksiyonu degildir. R fonksiyonlari R'in icinde bulunan
# "isim()" seklindeki, arkasindaki kod blogu gozukmeyen yardimcilarimizdir.

# Matematiksel islemler "Operator"dur. 
