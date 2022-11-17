#! Kullanıcının girdiği sayı kadar vize-final sınavları girilebilmesi beklenmektedir.
# ders sayısı gireceğiz ona göre her ders için 1 vize 1 final girilecek
# ve girilen vize final dersin ortalaması alınıp geçip kalınan
# ders sayısını bulmamız gerekli
#Programımızı geliştirerek ; Girilen her geçilen ve kalınan ders notlarını birer listede tutmanız beklenmektedir. 

ders_sayisi = int(input('ders sayısı giriniz: '))

gecilen_ders = 0
kaldigimiz_ders=[]
gectigimiz_ders=[]
for i in range(1,ders_sayisi+1):
    
    vize = float(input(f'vize{i}: '))
    final = float(input(f'final{i}: '))
    ortalama = (vize*0.4)+(final*0.6)
    
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
    
    if harf != 'FF':
        gecilen_ders+=1
        gectigimiz_ders.append(ortalama)
    else:
       kaldigimiz_ders.append(ortalama) 

print(f"Geçilen ders sayısı: {gecilen_ders} ")
print(f"Kalınan ders sayısı: {ders_sayisi-gecilen_ders} ")
print(f"Kalınanan derslerin notu :{kaldigimiz_ders} geçtiğimiz derslerin notu: {gectigimiz_ders}")
