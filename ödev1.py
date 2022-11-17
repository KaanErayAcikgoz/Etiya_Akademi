################# Kodlama.io #####################

baslik = "Haberiniz Olsun" #string
vade = 20  #integer
faizOrani1 = 1.50 #float
faizOrani2 = 1.44
print(baslik)
print(type(baslik))
print(vade)
print(type(vade))
print(faizOrani1)
print(type(faizOrani1))

mesaj = "Hoşgeldin"
musteriAdi = "Kağan Eray"
musteriSoyadi = "AÇIKGÖZ"
sonucMesaj = mesaj + " " + musteriAdi + " " + musteriSoyadi + "!"
print(f"{mesaj} {musteriAdi} {musteriSoyadi}")
print(sonucMesaj)

sayi1 = 65
sayi2 = 25

print(sayi1 + sayi2)

print(sonucMesaj)



############# Şart Bloklarını anlayalım ###########
DolarDun = 7.95
DolarBugun = 7.75

if DolarDun > DolarBugun:
    print("Azalış oku")
    print("Bitti")

if DolarDun < DolarBugun:
    print("Artış oku")
    print("Bitti")


if DolarDun == DolarBugun:
    print("Eşittir oku")
    print("Bitti")



##############If Else Elif ###################### 

DolarDun = 7.95
DolarBugun = 7.65

if DolarDun > DolarBugun:
    print("Azalış oku")
    print("Bitti")

elif DolarDun < DolarBugun:
    print("Artış oku")

else:
    print("Eşittir oku")

print("Bitti")

#####################################################
##############Bölüm Ödevi 1##########################

sayi1= 25
sayi2= 35

if sayi1 > sayi2:
    print("Büyük sayı  sayi1")

elif sayi1 < sayi2:
    print( "Büyük sayı sayi2")   

else:
    print("Sayılar eşit")

######################################################
###################Bölüm Ödevi 2######################
sayi1=10
sayi2=12
sayi3= 15

#En küçük sayı için

if sayi1 < sayi2 and sayi1< sayi3:
    print(sayi1)

elif  sayi2 < sayi1 and sayi2 < sayi3:
    print(sayi2)   

else:
     sayi3 < sayi1 and sayi3 < sayi1
     print(sayi3)
    
#En büyük  sayı için
if sayi1 > sayi2 and sayi1> sayi3:
    print(sayi1)

elif  sayi2 > sayi1 and sayi2 > sayi3:
    print(sayi2)   

else:
     sayi3 > sayi1 and sayi3 > sayi1
     print(sayi3)
    
#####################################################
###############Bölüm Ödevi 3#########################
oncekiAltınFiyati=1054.901
bugunkiAltınFiyati=1051.009

if oncekiAltınFiyati > bugunkiAltınFiyati:
    print("Azalmış")
elif oncekiAltınFiyati < bugunkiAltınFiyati:
    print("Artmış")
else:
    print("Değişmemiş")



print("İlk  Ödev Kağan Eray AÇIKGÖZ")
