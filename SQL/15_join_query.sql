--ürün,kategori
select p.name as "Ürün",c.name as "Kategori" from products p
inner join categories c
on p.category_id = c.id;

--ürün,stok
select p.name as "Ürün",s.count as "Stok Adedi" from products p 
inner join stocks s
on p.stock_id = s.id;

--ürün,size
select p.name as "Ürün",s.name as "Beden" from products p
left join size_products sp
on p.id = sp.product_id
full outer join sizes s
on sp.size_id = s.id

--ürün,indirim
select p.name as "Ürün",d.name as "İndirim Türü",d.percent as "İndirim Yüzdesi" from products p
inner join discounts d
on p.discount_id = d.id;

--kategori,ürün,marka
select p.name as "Ürün",c.name as "Kategori",b.name as "Marka" from categories c
right join products p
on c.id = p.category_id
full outer join brand_products bp
on p.id = bp.product_id
left join brands b
on bp.brand_id = b.id;

--marka,ürün
select b.name as "Marka",p.name as "Ürün" from brands b
inner join brand_products bp
on b.id=bp.product_id
full outer join products p
on bp.brand_id=p.id

--satıcı,rating
select s.name as "Satıcı",r.score as "Puan" from sellers s
inner join ratings r
on s.rating_id = r.id

--satıcı,follower
select s.name as "Satıcı",f.count "Takipçi Sayısı" from sellers s
inner join followers f
on s.follower_id = f.id

--satıcı,satılan_ürün1
select s.name as "Satıcı",p.name as "Ürün" from sellers s
full outer join products_sellers ps
on s.id=ps.seller_id
full outer join products p
on ps.product_id = p.id

--satıcı,satılan_ürün2
select s.name as "Satıcı",p.name as "Ürün" from sellers s
left join products_sellers ps
on s.id = ps.seller_id
full outer join products p
on ps.product_id = p.id

--ödeme_detayı_ödeme_türü
Select pds.Status "Ödeme Durumu", pts.payment_options "Ödeme Yöntemi" from payment_details pds
right join payment_types  pts
on pds.payment_type_id= pts.id

--sipariş_detayları,müşteri
SELECT od.id as "Order ID", cu.username as "Müşteri Kullanıcı Adı"
FROM order_details od
LEFT JOIN customers cu
ON od.customer_id = cu.id

--değerlendirme,müşteri
select us.id as "Rating ID", cu.username as "Kullanıcı Adı" from  user_reviews us
full outer join customers cu
on cu.id= us.customer_id

--iade,ürün
select r.id as "İade ID", rp.product_id as "Ürün ID" from returns r
left outer join return_products rp
on r.id=rp.return_id
full outer join products p
on rp.return_id=p.id

--ülke,şehir
select c.name as "Ülke",ci.name as "Şehir" from countries c
right join cities ci
on c.id = ci.country_id;

--ülke,şehir,ilçe
select c.name as "Ülke",ci.name as "Şehir",t.name as "İlçe" from countries c
left join cities ci
on c.id = ci.country_id
full outer join towns t
on ci.id = t.city_id;

--adres,sokak
select a.title as "Adres Başlığı",s.name as "Sokak No." from adresses a
inner join streets s
on a.street_id = s.id;
