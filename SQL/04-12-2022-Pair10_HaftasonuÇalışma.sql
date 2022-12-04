--1 toplam kargo ücretini şirket adlarına göre gösteren sorgu
select s.name as "kargo şirketi ", sum(shipment_fee) as " toplam kargo ücreti"  from shippers s
group by s.name

select* from products

--2 indirimli ve içinde b harfi olan ürünleri listeleyelim
select p.name as "ürün adı", op.discount_id from products p
inner join order_products op
on p.id=op.product_id
where name like '%t%'

--3
--4. harfi t olan ürünleri listeleyelim 
select distinct(name) from products
where lower (name) like '___t%'

--4
--Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız 
--(alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)
insert into baskets(customers_id,shipper_id,address_id,product_id,payment_id,category_id,discount_id,total_price)
values(16,1,2,15,1,7,1,99);
insert into baskets(customers_id,shipper_id,address_id,product_id,payment_id,category_id,discount_id,total_price)
values(13,2,4,6,2,1,1,20);
insert into baskets(customers_id,shipper_id,address_id,product_id,payment_id,category_id,discount_id,total_price)
values(17,3,6,13,3,6,1,150);

--5-Sipariş oluşturduktan sonra sepeti boşaltacak komutu oluşturunuz.
truncate table  baskets

6--İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
p.name "ürün adı", op.total_price "indirim öncesi fiyat", dis.discount_amount "indirim tutarı",
(op.total_price * dis.discount_amount) "indirim sonrası fiyat"
select p.name "ürün adı", op.total_price "indirim öncesi fiyat", dis.discount_amount "indirim tutarı",
(op.total_price * dis.discount_amount) as "indirim sonrası fiyat" FROM discounts dis
inner join order_products op
on dis.id = op.discount_id
inner join products p
on op.product_id = p.id

7--Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz.

insert into customer_reviews (description, customer_id, order_products_id)
values ('Hiç beğenmedim. Sakın almayın.', 17, 9)

insert into customer_reviews (description, customer_id, order_products_id)
values ('Çok güzel.', 16, 5)


8--Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.

insert into 
product_return (return_entry_date, payment_return_date, order_product_id, 
				return_status_id, customer_id, return_reason, refund_amount)
values ('2023-01-30','2023-02-15', 8, 2, 16, 'yanlış ürün geldi', 300)

insert into 
product_return (return_entry_date, payment_return_date, order_product_id, 
				return_status_id, customer_id, return_reason, refund_amount)
values ('2023-01-30','2023-02-15', 10, 1, 16, 'bozuk ürün geldi', 400)



9--İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.

update product_return
set return_status_id = 2
where id  = 2

update product_return
set return_status_id = 2
where id  = 4


10--Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.

select * from products

update products
set name = 'sucuk', unit_price = 125, category_id = 2, stocks = 80
where id = 4

--11 Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak 
--update komutunu geliştiriniz.
update orders
set order_statues_id = 4
where id = 3

--12 Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.
insert into baskets(customer_id,shipper_id,address_id,product_id,payment_id,category_id,discounts_id,totalprice)
values(18,3,6,13,3,6,2,1800);


--13Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz
update baskets
set quantity = 20
where id = 7 and customer_id = 17


--14 En az bir sipariş vermiş ancak hiç "UPS Kargo" kullanmamış müşterileri listeleyiniz
select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", c.email as "Müşteri maili", o.shipper_id as "kargo id", s.name as "kargo adı" from customers c
inner join orders o
on o.customer_id = c.id
inner join shippers s
on o.shipper_id = s.id
where not shipper_id = 2 

--15 En az bir adet aynı üründen sipariş vermiş kullanıcıları ve ürünü listeleyiniz.
select count(op.orders_id) "sipariş sayısı",  p.name, c.name from order_products op
inner join orders o
on op.orders_id = o.id
inner join products p
on op.product_id = p.id
inner join customers c
on o.customer_id = c.id
group by  p.name,  c.name


--16 Onaylanmamış ödemeleri listeleyiniz.
select os.statues_name, o.order_statues_id from  orders o
full outer join order_statues os
on o.order_statues_id = os.id
where o.order_statues_id = 6


17--Türkiye'de 2 farklı adresi olan kullanıcıları listeleyiniz.

select ad.customer_id, co.id, co.country_names, count(co.id) from country co
inner join adresses ad
on co.id = ad.country_id
inner join customers cu
on ad.customer_id = cu.id
group by ad.customer_id, co.id, co.country_names
having count(ad.customer_id) >=2

18--İstanbul'da en az 1 adet sipariş vermiş kullanıcıları listeleyiniz.

select count(ad.customer_id), ci.city_names, co.country_names from city ci
inner join country co
on ci.id = co.city_id
inner join adresses ad
on co.id = ad.country_id
inner join orders o
on ad.customer_id = o.id
group by ad.customer_id, ci.city_names, co.country_names
having count(ad.customer_id) >=2

