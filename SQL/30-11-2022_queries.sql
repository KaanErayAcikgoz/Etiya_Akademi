--distinct
select distinct type from categories;

--like
select username,mail from customers where username like '%an%';

--and,or,not
select id,name from products where stock_id = 2 and (category_id = 3 or not discount_id = 3);

--order by
select * from customers order by first_name;

--insert into

insert into customers (id,username,first_name ,second_name, mail, phone)
values ( '6','toprakcan', 'Toprak', 'can', 'toprakcan@gmail.com', '05314297358');

insert into adresses (id,title,adress_line,zipcode,street_id,customer_id)
values (3,'Ev2',null,01945,6,4);

insert into customers (id,username,first_name,second_name,mail,phone)
values (6,'suleymancakir','Süleyman','Çakır','suleyman.cakir@etiya.com','05322579024');

insert into reasons (id,return_options)
values (5,'bkldigm gbi deqilDi');

--delete
delete from customers where username = 'suleymancakir';

--update
update reasons set return_options = 'Beklediğim gibi değildi' where id = 5;

--null
select * from products where descr is not null;

--select top
select name from products where unit_price > 17 limit 3;

--min max
select max(unit_price) from products;

--wildcard
select * from customers where username like '_a%';

--in
select * from products where unit_price not in (15,16,25) and descr is not null;

--between
select * from products where unit_price between 15 and 20
and category_id not in (3,2)
and descr is null;

--group by
select count(*),unit_price from products 
where unit_price between 16 and 21 
group by unit_price
order by unit_price desc;

--having
select s.count, count(p.stock_id) from (products p left join stocks s on p.stock_id = s.id)
group by s.id
having(count(s.count) < 100 or count(s.count) = 0)
order by s.count desc;

--having avg
select category_id,avg(unit_price) from products
group by category_id
having(avg(unit_price) > 19)
order by category_id

--Toplam stok adeti
select sum(count) from stocks s;

--Satışta olan tüm ürünlerin ortalama fiyatı
select avg(unit_price) from products as p;

--Belirli bir kategorideki ürünlerin ortalama fiyatı
select avg(unit_price) from products
group by category_id
having (category_id) = 1;

--Toplam kayıtlı kullanıcı sayısı
select count(id) from customers as c

-----
select name as "Ürün İsmi",unit_price as "Fiyat" from products as p
where category_id=4 and unit_price < 50
order by unit_price asc

--Insert ile veri ekleme
insert into products as p  (name, unit_price, stock_id, category_id, discount_id)
values  ('Puma Roma Basic', 350, 2, 1, 1);

--Tablo güncelleme
--Tanımlanan kategorideki bütün ürünlere yeni bir tanımlanmış indirim oranı atama
update products as p
set discount_id=2
where stock_id=1

--Belirli bir kullanıcının adres bilgilerini güncelleme 
update adresses as ad
set title='İşyeri Adresi', street_id=2
where customer_id=3;

--Database oluşturma
create database deneme

--Alter  kolon ekleme
alter table customers
add Birthday Date;

--Alter kolon silme
alter table customers
drop column Birthday;

-- Group By
--bir kişinin birden fazla maili var ve Maile göre gruplama
select count(id), mail
from customers
group by mail;

--Order By 
--Birim fiyata göre büyükten küçüğe sıralama
select count(id), unit_price
from products
group by unit_price
order by count (id)desc;
 
--Insert into 
--müşteri ekleme
insert into customers (id,username,first_name ,second_name, mail, phone)
values ( '6','toprakcan', 'Toprak', 'can', 'toprakcan@gmail.com', '05314297358');

--Delete 
delete from customers
where username = 'toprakcan';

--Update 
--adres güncelleme
update adresses
set name = 'Antalya'
where  id = 1;

--Count 
--ürünleri saydırma
select count(id)
from products;

--Average
--birim fiyat ortalaması alma
select avg(unit_price)
from products

--Sum
--kategori id 1 olan ürünlerin birim fiyatının toplamının 80den küçük olduğu
select sum(unit_price) from products p
group by category_id=1
having sum(unit_price) < 80


--join---------------

--ürün,stock
select s.count as "Stok Adedi" ,p.name as "Ürün" from products p 
inner join stocks s
on p.stock_id = s.id;

---ürün,marka
select p.name as "Ürün",b.name as "Marka" from brands b
inner join brand_products bp
on b.id=bp.product_id
full outer join products p
on bp.brand_id=p.id

---ödeme_detayı,ödeme_türü
Select pds.Status "Ödeme Durumu", pts.payment_options "Ödeme Yöntemi" from payment_details pds
right join payment_types  pts
on pds.payment_type_id= pts.id

--renkler, ürünler
select co.name as "renk ",p.name as "ürün" from colors co
inner join color_products cp
on co.id=cp.color_id
full outer join products p
on cp.color_id=p.id

--reason ,returns
select r.id as "sebep",ret.id as"geri dönüş" from reasons r
left join reasons_returns rr
on r.id=rr.reason_id
full outer join returns ret
on rr.reason_id =ret.id

--join
select max(s.count) from products p
inner join stocks s
on p.stock_id = s.id;

--join+concat
select c.username as "Kullanıcı", concat(s.name,' Sk., ',a.zipcode,' ',ci.name,', ',co.name) as "Adres" from customers c
full outer join adresses a
on c.id = a.customer_id
inner join streets s
on a.street_id = s.id
inner join towns t
on s.town_id = t.id
inner join cities ci
on t.city_id = ci.id
inner join countries co
on ci.country_id = co.id;

--join
select p.name as "Ürün",concat(d.name,' = ',d.percent) as "İndirim" from (products p inner join discounts d on p.discount_id = d.id)
group by p.name,d.name,d.percent
having(d.percent > 5)
order by d.percent desc

--Sipariş verilen ürüne göre ödeme detayı sorgulama
select od.id, od.total_price, od.customer_id, od.product_id, od.seller_id from order_details as od
inner join products as p
on od.product_id=p.id;
