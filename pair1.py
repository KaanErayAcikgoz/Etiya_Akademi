#! kullanıcıdan vize ve final notları alacak.
#! vize %40  final %60 etkili olacak
#! vize ve final notları 50.5 gibi ondalıklı sayılar olabilir
#! uygulama ortalamayı hesaplayacak ve ortalamaya göre
#! 0-49 FF
#! 50-60 DD
#! 60-70 CC
#! 70-80 BB
#! 80-100 AA
#! not ortalamasını ve not harfini kullanıcıya gösterecek programı kodlayınız.

vize = float(input('vize: '))

final = float(input('final: '))
ortalama = vize*0.4 + final*0.6

if (ortalama>=0) and (ortalama<=49):
    harf = 'FF'
elif (ortalama>=50) and (ortalama<=59):
    harf = 'DD'
elif (ortalama>=60) and (ortalama<=69):
    harf = 'CC'
elif (ortalama>=70) and (ortalama<=79):
    harf = 'BB'
elif (ortalama>=80) and (ortalama<=100):
    harf = 'AA'
else:
    print('Hatalı girdiniz.')

print(f"Not ortalaması: {ortalama}, Harf notu: {harf} ")


#ek
# #######################
#vize = input("Vize:")
#final = input("Final:")
 
#sonuc = float(vize)*(0.4) + float(final)*(0.6)
#if sonuc>80 and sonuc<100:
   # print("Harf Notu: AA")
#elif sonuc>=70 and sonuc<80:
    #print("Harf Notu: BB")

#elif sonuc>=60 and sonuc<70:
    #print("Harf Notu: CC")
#elif sonuc>=50 and sonuc<60:
    #print("Harf Notu: DD")
#elif sonuc>=0 and sonuc<50:
    #print("Harf Notu: FF")
#print ("Ortalama") 
#print (sonuc)

########ek2##
#print("vize Notunuzu giriniz")
#vizeNotu=float(input())
#print("final Notunuzu giriniz")
#finalNotu=float(input())

#ortalamanot=vizeNotu*0.4 + finalNotu*0.6
#print(ortalamanot)

#if ortalamanot <50 and ortalamanot>0:
 #   print("FF ile kaldınız")
#elif ortalamanot>=50 and ortalamanot<60:
 #   print("DD ile geçtiniz")
#elif ortalamanot>=60 and ortalamanot<70:
 #   print("CC ile geçtiniz")
#elif ortalamanot>=70 and ortalamanot<80:
 #   print("BB ile geçtiniz")
#elif ortalamanot>=80 and ortalamanot>=100:
 #   print("AA ile geçtiniz")
#else: 
  # print(f"Sınava girmediniz notunuz:{ortalamanot}")

