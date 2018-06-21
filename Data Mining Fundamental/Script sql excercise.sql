--SESSION 1

--menghapus ketika ada tabel dengan nama sama
drop table if exists astra_nikita;
--membuat tabel baru
create table astra_nikita(
--masukin kolom kolom
Id varchar (5) not null,
employe varchar(38),
initial varchar(5),
--ngejadiin kolom Id menjadi primary key
primary key (Id));

-- untuk menambahkan kolom
alter table astra_nikita add
age smallint;

--merename kolom baru yang tadi dibuat
alter table astra_nikita rename
age to umur;

--mengubah tipe data
alter table astra_nikita alter column
umur type integer;

--drop column
alter table astra_nikita drop umur;

--inksert row to all column
insert into astra_nikita values
('1','Nancy Parker', 'NAP'),
('2','Janet Anabi','JAN');

select * from astra_nikita;

--Insert row to specific column
insert into astra_nikita(id, employe) values
('3','Robert Rodiguez');

select* from astra_nikita;

--update row
update astra_nikita set
initial = 'RRO'
where Id='3';

select* from astra_nikita;

--Delete row
delete from astra_nikita
where Id='3';

--truncate table, menghapus isi dari tabel tanpa menghapus tabelnya
truncate table astra_nikita;


select * from astra_nikita;

--drop table
drop table astra_nikita;

select * from astra_nikita;


--SESSION 2

--select all column
select* from wage;

-- select specific column
select employeename, jobtitle, basepay from wage;

--count= kalo nul tetep dihitung (hitung row aja)
select count (*) from wage;

--count= untuk kolom dimana null tidak dihitung tapi duplicate dihitung
select count (jobtitle) from wage;

--select DISTINCT
select distinct jobtitle from wage;

--count distinct
select count (distinct jobtitle) from wage;

--where clause

--operator =><
select * from wage
where jobtitle= 'NURSE MANAGER';

select * from wage
where overtimepay =0;

--and, or, not
select employeename, jobtitle, basepay from wage
where jobtitle = 'SHERiFF' or jobtitle='ENGINEER';

select employeename, jobtitle, basepay from wage
where jobtitle='ENGINEER' and basepay>150000;

select employeename, jobtitle, basepay from wage
where not jobtitle='ENGINEER'and basepay>100000;

select employeename, jobtitle, basepay from wage
where not jobtitle='ENGINEER'and not basepay>100000;

select employeename, jobtitle, basepay from wage
where (jobtitle='ENGINEER'or jobtitle='SHERIFF');

select employeename, jobtitle, basepay from wage
where jobtitle in('ENGINEER','SHERIFF') and basepay>150000;


select employeename, jobtitle, basepay from wage
where jobtitle not in('ENGINEER','SHERIFF') and basepay>150000;

--between to set range

select employeename, jobtitle, basepay from wage
where totalpay between 20000 and 50000;


select employeename, jobtitle, basepay from wage
where totalpay between 20000 and 50000 and jobtitle='ENGINEER';

--LIKE search spesific pattern
--% the percent sign represent multiple character
--_ the underscore represent a single character

--start with A= kalo carinya A nanti yang keluar yang huruf pertamanya pake huruf A kapital
select employeename from wage
where employeename like 'A%'

-- end with A= buat yang hurufnya ga kapital dia ga bakal dianggep A%, bisa sebelum di like di upper dulu
select employeename from wage
where employeename like '%A'

-- untuk nyiasatin syntaxnya ditambahin upper biar tulisan yang kapita. teteyp keambil dan kebaca a
select employeename from wage
where upper(employeename) like '%A'

select employeename from wage
where upper(employeename) like 'A%N'

select employeename from wage
where upper(employeename) like '%ANA%'

--contain spesific character in spesific position
select employeename from wage
where upper(employeename) like '_M%'--berarti m sebagai huruf keduanya terus setelah huruf m bebas

--start with minimum x char
select employeename from wage
where upper(employeename) like 'AB_%' --ada orang diawali dengan huruf ab dengan minimal ada 3 karakter dimana huruf setelakhnya bebas

--NOT LIKE
select employeename from wage
where upper(employeename) not like 'A%N'

--null values
--field with nul is field with no values
-- can not use operator =><, instead using is null

select * from wage
where years is null;

select * from wage
where jobtitle is not null;

select distinct jobtitle from wage
where jobtitle is not null;

--sorting, use order by, default= acsending

--order asc
select employeename, jobtitle, basepay from wage
order by basepay desc;

--order desc with limit
select employeename,jobtitle, basepay from wage order by basepay desc
limit 5;

select employeename,jobtitle, basepay from wage 

where basepay is not null
order by basepay desc
limit 5;


--EXERCISE
--no1. Seluruh mobil mazda dan spesifikasinya
select* from carspec
where brand='mazda';
--no2. Daftar brand mobil, sort ascending
select distinct brand from carspec
order by brand asc;
--no3. Ada berapa jenis bodystyle
select distinct bodystyle from carspec;
select count (distinct bodystyle) from carspec;
--no4. mobil dengan harga antara 6000 dan 9000
select brand, price from carspec
where price between 6000 and 9000;
--no5. Brand , Bodystyle, Engine Size, Horse power and price dimana 
--price lebih besar dari 15750 dan horse power lebih kecil dari 106
select brand, bodystyle, engsize, hp, price from carspec
where price > 15750 and hp<106;
--no6.mobil brand alfa-romero, bmw, jaguar, mazda, toyota dengan harga>8000
select brand, price from carspec
where brand in('alfa-romero','bmw','jaguar','mazda','toyota') and price>8000;
--no7. mobil selain mitsubishi, dodge, honda, isuzu dengan drivewheels bukam fwd
select brand, drivewheels from carspec
where brand not in('mitsubishi','dodge','honda','isuzu') and drivewheels not like 'fwd';
--no8. Brand mobil yang dimulai dari huruf a
select brand from carspec
where upper(brand) like'A%';
--no9. jumlah mobil bmw
select count (brand) from carspec
where brand='bmw';
--no10. car id, brand, citympg, price untuk mobil selain sedan urutkan descending
select carid, brand, citympg, price from carspec
where bodystyle not like 'sedan'
order by price desc;
--no11. mobil termahal, berapa harganya
select brand, price from carspec 
order by price desc
limit 1;
--no12. harga audi termurah
select brand, price from carspec
order by price
limit 1;
--no13. mobil honda dengan horse power tertinggi dan harga dibawah 8000
select brand, hp, price from carspec
where price <8000 and brand ='honda'
order by hp desc
limit 1;

--SESSION 3

--AGGREGATE FUNCTION,
--calculation on a set of values and return a single values

--COUNT
--banyak record pada setiap tahun
select years, count(years) as cnt_yr from wage
where years is not null
group by years;

--SUM
--Jumlah basepay setiap jobtitle pada tahun 2011, diurutkan berdasarkan jumlah tertinggi
select years, jobtitle, count(basepay) as sum_bsp from wage
where years ='2011' and jobtitle is not null
group by years,jobtitle
order by sum_bsp desc;

--AVERAGE
--rata-rata totalpay nurse manager di setiap tahun diurutkan dari yang terbaru
select jobtitle, years, avg(totalpay) as mean_tp  from wage
where jobtitle='NURSE MANAGER' and years is not null
group by years, jobtitle
order by years desc;

--MAX
--maximum total pay setiap jobtitle di setiap tahun,
--urutkan berdasarkan tahun dan nilai max pay
select years, jobtitle, max(totalpay) as max_pay from wage
where jobtitle is not null
group by years, jobtitle
order by years,max_pay desc;

--MIN
--maximum total pay setiap jobtitle di setiap tahun,
--urutkan berdasarkan tahun dan nilai max pay
select years, jobtitle, min(totalpay) as min_pay from wage
where jobtitle is not null
group by years, jobtitle
order by years,min_pay;

--having clause untuk konodisi dimana jika menggunakan where akan error
select jobtitle, sum(totalpay) as sum_pay from wage
group by jobtitle
--having
select jobtitle, sum(totalpay) as sum_pay from wage
group by jobtitle
having sum(totalpay)>10000000;

--case when
select totalpay,pay_group
from(
	select totalpay,
		case when totalpay>200000 
		then 'hi-paid' else 'med-paid'
		end as pay_group
	from wage
	)t1	
where pay_group='hi-paid';
	
select totalpay,
	case when totalpay>200000 then 'hi-paid'
 		when totalpay > 175000 and totalpay<=200000
 		then 'med-paid'
		else 'low-paid'
	end as pay_group
from wage 
limit 50;


--EXCERCISE 2
--no1. Banyak mobil terjual untuk setiap brand , urutkan berdasarkan banyaknya yang terjual
select brand, count(brand) as cnt_br from carspec
where brand is not null
group by brand
order by cnt_br;

--no2. rata-rata harga setiap brand mobil dengan mesin 4 cylinders
select brand, cylinders, round(avg (price),2) as mean_price from carspec
where brand is not null and cylinders='four'
group by cylinders, brand;

--no3. maksimuma horse power berdasarkan engine cylinders
select brand, cylinders, max(hp) as max_hp from carspec
where brand is not null
group by brand,cylinders
order by max_hp desc
limit 1;

--no4. enginesize terendah berdasarkan bodystyle untuk mobil honda
select bodystyle, brand, min(engsize) as min_eng from carspec
where brand = 'honda'
group by brand, bodystyle
order by min_eng
limit 1;

--no5. rata-rata konsumsi fuel di highway (highway mpg), berdasarkan fuel type dan drivewheel
select drivewheels,fuel, round(avg(highwaympg),2) as high_mpg from carspec
group by fuel, drivewheels;

--WINDOW FUNCTION +SUB QUERY

--RANK
select carid,brand, price, 
rank() over(partition by brand order by price desc) as rnk
from carspec
order by brand;

--ROW NUMBER
select carid, brand, price,
row_number() over (partition by brand order by price) as R_num
from carspec
order by brand

--SUBQUERY
select carid, brand, price, r_num
from(
select carid, brand, price, Row_number() over(partition by brand order by price desc) as r_num
from carspec
order by brand
) t1
where r_num<=3

select totalpay,pay_group
from(
	select totalpay>200000 
	
	case when totalpay>200000 then 'hi-paid'
 		when totalpay > 175000 and totalpay<=200000
 		then 'med-paid'
		else 'low-paid'
	end as pay_group
from wage 
limit 50;

--no1.3 mobil paling irit di highway untuk brand honda, toyota, mitsubishi
select carid, brand, highwaympg, r_num
from(
select carid, brand, highwaympg, Row_number() over(partition by brand order by highwaympg desc) as r_num
from carspec
order by brand
) t1
where r_num<=3 and brand in ('honda','toyota', 'mitsubishi')

--no2. 3 mobil termurah berdasarkan brand
select brand, price, r_num
from(
select  brand, price, Row_number() over(partition by brand order by price) as r_num
from carspec
order by brand
) t1
where r_num<=3

--inner join count
select count(*) from
carrisk inner join carspec
on carrisk.carid=carspec.carid;

--left join count
select count(*) from
carrisk a left join carspec b
on a.carid=b.carid;

--right join count
select count(*) from
carrisk a right join carspec b
on a.carid= b.carid;

--full outer join count
select count(*) from
carrisk a full outer join carspec b
on a.carid =b.carid;

--no1. perusahaan asuransi mobil ingin mengelompokkan mobil yang bersiko positif dan negatif
-- tampilkan kolom_ baru yang menunjukkan kelompok resiko tersebut
--nama kolom=riskgrup
--kategori jika risk positif=='positive'
--kategori jika risk negatif=='negative'

create view view_risk_group as 
select brand, risk,
		case 
		when risk<1 then 'negative' else 'positive'
		end as risk_group
	from
	carrisk ij inner join carspec ji
	on ij.carid=ji.carid

	
select * from view_risk_group;


--no2. tampilan yang positive aja 
select * from view_risk_group
where pay_group='positive'

--no3. ingin diketahui hubungan antara insurance risk dengan brand mobil dan harga mobil
--tampilkan 5 mobil termahal untuk setiap risk level mobil
-- dengan insurance prisk positif
--[tampilkan risk, brand, price]
 
select brand, risk, price, rank_price
	from(select brand, risk, price,
	case 
		when 
	 


	