--Müşteri tablasouna kendi isimlerimizi girelim.

Insert into customers(id,name,surname,email) 
values (13,'Emre','Özköse','m.emre.ozkose@gmail.com');

Insert into customers(id,name,surname,email)
values (14,'Hande','Yetişen','h.yetisen@gmail.com');

Insert into customers(id,name,surname,email)
values (15,'Kadriye','Çakmak','kadriye.c@hotmail.com');

Insert into customers(id,name,surname,email)
values (16,'Kağan Eray','Açıkgöz','eray.acikgoz@etiya.com');

Insert into customers(id,name,surname,email)
values (17,'Özlem Öykü','Çimen','ozlem.oyku@etiya.com');




--Ürün çeşitliğini arttıralım
insert into products (name,unit_price,category_id,stocks)
values ('Cep Telefonu',35000,4,27)

insert into products (name,unit_price,category_id,stocks)
values ('Emzik',150.99,6,50)

insert into products (name,unit_price,category_id,stocks)
values ('',60,7,2)

insert into products (name,unit_price,category_id,stocks)
values ('Karamazov Kardeşler',99,7,5)

insert into products (name,unit_price,category_id,stocks)
values ('Allık',250,5,75)

insert into products (name,unit_price,category_id,stocks)
values ('Cep Telefonu',3000,4,60)


--Sorgu Sepetinde o an en az 5 ürün olan customerları listeleyiniz.
select cu.name,cu.surname,cu.email, op.quantity from customers cu
inner join orders o
on cu.id = o.customer_id
inner join order_products op
on op.orders_id = o.id
where quantity >=5

-- Bugüne kadar verdiği sipariş toplamı 250₺'yi geçen customerları listeleyiniz.
select cu.name,cu.surname,cu.email, op.total_price from customers cu
inner join orders o
on cu.id = o.customer_id
inner join order_products op
on op.orders_id = o.id
where op.total_price > 250

-- Bugüne kadar en az 1000₺ satış yapmış satıcıları listeleyiniz.

select distinct se.type, op.total_price from sellers se
LEFT join product_sellers ps
on se.id = ps.seller_id
inner join order_products op
on ps.seller_id = op.product_id
where op.total_price > 1000


-- Her kategoride en çok kazandıran ürünü (price * quantity değeri ele alınmalıdır) listeleyiniz.
select distinct cat.name, max(p.unit_price * p.stocks) as "toplam fiyat" from categories cat
left join products p
on cat.id = p.category_id
full outer join order_products op
on p.id = op.product_id
group by cat.name

-- Satıcıları sattığı ürün adedine göre büyükten küçüğe sıralayınız.

select * from sellers
order by product_number desc

-- Siparişleri içerdiği ürün adedine göre listeleyiniz.

select orders_id "sipariş numarası", quantity as "ürün adedi" from order_products
group by orders_id, quantity
order by quantity

-- Kargo şirketlerine göre sipariş adedini listeleyiniz.

select * from order_products op

select sh.name, count(*) from order_products op
inner join orders o
on op.orders_id = o.id
inner join shippers sh
on o.shipper_id = sh.id
group by sh.name

--kargo şirketlerinin aldıkları en yüksek sipariş sayıları 
select sh.name, max(quantity) from order_products op
inner join orders o
on op.orders_id = o.id
inner join shippers sh
on o.shipper_id = sh.id
group by sh.name

