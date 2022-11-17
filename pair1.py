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



