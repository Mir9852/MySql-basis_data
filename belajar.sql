Create Table barang
(
	kode int not null,
	name varchar(100) not null,
	harga int not null default 1000,
	jumlah int not null default 0,
	waktu_dibuat timestamp not null default current_timestamp
);

Alter Table barang
Add Column deskripsi text;

Alter Table barang
Drop Column deskripsi;

Alter Table barang
Rename Column name to nama;

Truncate barang; --membuat ulang table

Drop Table barang;

Create Table products
(
	id varchar(10) not null,
	name varchar(100) not null,
	description text,
	price int not null,
	quantity int not null default 0,
	created_at timestamp not null default current_timestamp
);

insert into products (id, name, price, quantity)
values('P0001', 'Mie Ayam Original', 15000, 100);

insert into products(id, name, description, price, quantity)
values('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 100);

insert into products(id, name, price, quantity)
values('P0003', 'Mie Ayam Ceker', 20000, 100),
	  ('P0004', 'Mie Ayam Spesial', 25000, 100),
	  ('P0005', 'Mie Ayam Yamin', 15000, 100);

select * from products;

select id, name, price, quantity from products;

alter table products
add primary key (id);

select id, name, price, quantity
from products
where quantity = 0;

select id, name, price, quantity
from products
where price = 20000;

select id, name, price, quantity
from products
where id = 'P0004';

Create Type Product_Category As Enum ('Makanan', 'Minuman', 'Lain-lain');

alter table products
	add column category Product_Category;

Update products
Set category = 'Makanan'
where id = 'P0001';

Update products
Set category = 'Makanan'
where id = 'P0002';

Update products
set category = 'Makanan',
	description = 'Mie Ayam + Ceker'
where id = 'P0003';

Update products
Set category = 'Makanan'
where id = 'P0004';

Update products
Set category = 'Makanan'
where id = 'P0005';

update products
set price = price + 5000
where id = 'P0004';

select * from products;

insert into products(id, name, price, quantity, category)
values ('P0009', 'Contoh', 10000, 100, 'Minuman');

Delete from products
where id = 'P0009';

select id as "Kode Barang", price as "Harga Barang", description as "Deskripsi Barang" from products;

select p.id as Kode, 
	p.price as Harga, 
	p.description as Deskripsi 
	from products as p;

select * from products where price > 15000; 

select * from products where price <= 15000;

select * from products where category != 'Minuman';

select * from products where price > 15000 and category = 'Minuman';

select * from products where price > 15000 or category = 'Makanan';

insert into products(id, name, price, quantity, category)
values ('P0006', 'Es Teh Tawar', 10000, 100, 'Minuman'),
	  ('P0007', 'Es Campur', 20000, 100, 'Minuman'),
	  ('P0008', 'Jus Jeruk', 15000, 100, 'Minuman');
	  
select * from products where price < 15000 or category = 'Minuman';

select * from products where (quantity > 100 or category = 'Makanan')
		and price > 15000;

select * from products where category = 'Makanan' or (quantity > 100 and price > 15000);

select * from products where name ilike '%mie%';

select * from products where name ilike '%bakso%';

select * from products where name ilike '%es%';

select * from products where description is null;

select * from products where description is not null;

select * from products where price between 10000 and 20000;

select * from products where price not between 10000 and 20000;

select * from products where category in ('Makanan', 'Minuman');

select * from products order by price asc, id desc;

select * from products where price > 0 order by price asc, id desc limit 2;

select * from products where price > 0 order by price asc, id desc limit 2 offset 2;

select distinct category from products;

select 10 + 10 as hasil;

select id, name, price / 1000 as price_in_k from products;

select PI();

select power(10, 2);

select cos(10), sin(10), tan(10);

select id, name, power(quantity, 2) as quantity_power_2 from products;

create table admin
(
	id serial not null,
	first_name varchar(100) not null,
	last_name varchar(100),
	primary key (id)
);

drop table admin;

insert into admin(first_name, last_name)
values ('Muhamad', 'Amir'),
	   ('Eko', 'Khannedy'),
	   ('Budi', 'Nugraha');

select currval(pg_get_serial_sequence('admin', 'id'));

select currval('admin_id_seq');

create sequence contoh_sequence;

select nextval('contoh_sequence');

select currval('contoh_sequence');

select id, lower(name), length(name), lower(description)
from products;

select id, extract(year from created_at), extract(month from created_at) from products;

select id,
	   case category
	   		when 'Makanan' then 'Enak'
			when 'Minuman' then 'Seger'
			else 'Apa itu?'
	   end as category_case
from products;

select id,
		price,
		case
			when price <= 15000 then 'Murah'
			when price <= 20000 then 'Mahal'
			else 'Mahal Banget'
		end as "Apakah murah?"
from products;

select id,
		price,
		case
			when price <= 15000 then 'Murah'
			when price <= 20000 then 'Mahal'
			else 'Mahal Banget'
		end as "Apakah murah?"
from products;

select id,
		name,
		case
			when description is null then 'Kosong'
			else description
			end as description
from products;

select count(id) from products;

select avg(price) from products;

select max(price) from products;

select min(price) from products;

select category,
		count(id) as "Total Product"
from products
group by category;

select category,
		avg(price) as "Rata-rata Harga",
		min(price) as "Harga Termurah",
		max(price) as "Harga Termahal"
from products
group by category;

select category,
		count(id) as "Total Product"
from products
group by category
having count(id) > 3;

select category,
		avg(price) as "Rata-rata Harga",
		min(price) as "Harga Termurah",
		max(price) as "Harga Termahal"
from products
group by category
having avg(price) > 15000;

create table customer
(
	id serial not null,
	email varchar(100) not null,
	first_name varchar(100)not null,
	last_name varchar(100),
	primary key(id),
	constraint unique_email unique (email)
);

select * from customer;

insert into customer(email, first_name, last_name)
values ('amir@gmail.com', 'Muhamad', 'Amir');

insert into customer(email, first_name, last_name)
values ('budi@gmail.com', 'Budi', 'Nugraha'),
	   ('joko@gmail.com', 'Joko', 'Selamet'),
	   ('roby@gmial.com', 'Roby', 'Kurniawan');