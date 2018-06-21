-- 1. Menambahkan kolom risk_group berdasarkan nilai risk
select *, 
	case 
		when b.risk > 0 then 'positive'
		else 'negative'
	end as risk_group
from carspec a inner join carrisk b
on a.carid = b.carid


-- 2. Menampilkan mobil yang memiliki risk_group positive saja
select * 
from
(
	select *, 
		case 
			when b.risk > 0 then 'positive'
			else 'negative'
		end as risk_group
	from carspec a inner join carrisk b
	on a.carid = b.carid
)t0
where risk_group = 'positive'; 

-- 3. Ingin diketahui hubungan antara insurance risk dengan brand mobil dan harga mobil
--    Tampilkan 5 mobil termahal untuk setiap risk lebel mobil dengan insurance risk positive


select risk, brand, price, rownum
from (
	select risk, brand, price, row_number() over (partition by risk order by price desc) as rownum
	from
	(
		select *, 
			case 
				when b.risk > 0 then 'positive'
				else 'negative'
			end as risk_group
		from carspec a inner join carrisk b
		on a.carid = b.carid
	)t0
	where risk_group = 'positive'
	order by risk
) t1 
where rownum <= 5;

