--Avg
select * from order_products 
--1---ürünlerin toplam ortalama fiyatını gösteren sorgu 
select avg(total_price) as " toplam ortalama fiyat" from order_products 

--sum
--2--ürünlerin toplam stok adedini gösteren sorgu
select sum(stocks) as " toplam stok" from products

--count
--3-- müşteri sayılarını gösterelim
Select count(id) from customers

--Group By
--4--ürünlerin hangi kategoride kaç ürün olduğunu küçükten büyüğe gösterelim
select category_id,count(*) from products
group by category_id 
order by count

--4--Her kategoride kaç ürün olduğunu ürün sayısına göre küçükten büyüğe gösterelim ve kategori isimlerini listeleyelim.
select p.category_id, cat.name, count(*) from products p
inner join categories cat
on p.category_id = cat.id
group by p.category_id, cat.name
order by count 

--max
--5-- her bir ürünün en yüksek birim fiyatlı olanını  ürün adı ile gösterelim
select max(unit_price) as "en yüksek birim fiyata sahip ürün" , name as "ürün adı" from products
group by name 
order by max(unit_price) desc

--min
--6-- her bir ürünün en az stoklu olanını ürün adı ile gösterelim
select min(stocks) as "en az stoğa sahip ürün" , name as "ürün adı" from products
group by name 
 
--groupby/having
--7--en yüksek birim fiyatı 150'den büyük olan ürünleri kategori id,ürün adı ve birim fiyatlarına göre sıralayın  
select category_id ,name as "ürün adı",max(unit_price)  as "en yüksek birim fiyat" from products 
group by category_id,name,unit_price
having max(unit_price) > 150


--group by/having
--8--içinde en az 2 ürün olan siparişleri listele
select  orders_id "sipariş numarası", count(*) "ürün sayısı" from order_products
group by orders_id
having count(*) >=2


--group by
---9-- siparişleri  müşterilere göre gruplayalım
select cu.name from customers cu
inner join orders o
on cu.id=o.customer_id
inner join order_products op
on o.id=op.orders_id
group by cu.name 


---9-- siparişleri  müşterilere göre gruplayarak ödedikleri tutarları gösterelim.
select * from customers
select cu.name as "müşteri adı", cu.surname as "müşteri soyadı", sum(op.total_price) as "toplam ürün fiyatı" 
from customers cu
inner join orders o
on cu.id=o.customer_id
inner join order_products op
on o.id=op.orders_id
group by cu.name, cu.surname 


--sum
--10-- Tüm ürünler satıldığında elde edilecek toplam kazanç nedir?
select sum (unit_price*stocks) as "toplam kazanç" from products


--group by
--11--Bir ürünün kaç satıcısı var ve bu ürünler nelerdir?

select ps.product_id as "ürün kodu", p.name as "ürün adı", count(seller_id) as "satıcı sayısı" 
from product_sellers ps
inner join products p
on ps.product_id = p.id
group by ps.product_id, p.name


--distinct
--12--Hangi illerden sipariş verilmiştir?
select distinct city_names from city
select * from city


--distinct
--13--Satıcıları ratinglerine göre tekilleştirelim.

select distinct rating, name from sellers
group by rating, name

--group by
--14--Ürün kodu 2 olan üründen kaç adet sipariş verildiğini ve hangi ürün olduğunu gösterin.
select p.id as "ürün kodu", p.name as "ürün adı", count(*) as "ürün sayısı" from order_products op
inner join products p
on op.product_id = p.id
where p.id = 2
group by p.id, p.name


--group by/having
--15-- Kargo firmalarına ait sipariş sayılarını gösterin.
select sh.name as "kargo firması", count(*) as "sipariş sayısı" from shippers sh
inner join orders o
on sh.id = o.shipper_id 
group by sh.name
having count (*) >= 2







