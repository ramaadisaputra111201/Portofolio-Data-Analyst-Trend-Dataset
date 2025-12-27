# PERMASALAHAN : Kenapa sebuah produk bisa trending

select * from `rama adi`.trends_dataset;

# Banyak produk yang masuk kategori trending
select Trend_Status,
	count(*) as `Total Produk Trending`
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

# dari hasil diperoleh bahwa terdapat 42 produk yang termasuk dalam kategori trending

with cte as(
	select Trend_Status,
		(case
			when Popularity_Score < 4 then 'Low'
			when Popularity_Score < 7 then 'Medium'
			else 'High'
		end) as `Popularity Type`,
        count(*) as Jumlah
	from `rama adi`.trends_dataset
    group by Trend_Status, `Popularity Type`
)
select * 
from cte
 where Trend_Status = 'Trending' and `Popularity Type` = 'High'
 order by Jumlah desc;
 
 # dari hasil ini diperoleh bahwa terdapat 14 produk yg memiliki trend status Trending dan Popularity Score nya tinggi.
 
 with cte as(
	select Trend_Status,
		(case
			when Popularity_Score < 4 then 'Low'
			when Popularity_Score < 7 then 'Medium'
			else 'High'
		end) as `Popularity Type`,
        count(*) as Jumlah
	from `rama adi`.trends_dataset
    group by Trend_Status, `Popularity Type`
)
select * 
from cte
order by Trend_Status, Jumlah desc;

# Ternyata diperoleh fakta bahwa produk yg memiliki Popularity tinggi (cth : Outdated) belum tentu menjadi trending status.


# >> Hipotesis :

# 1. Apakah dengan nilai popularity score yang besar itu berpengaruh
-- Cek rentang nilai popularity score
select min(Popularity_Score) as `Minim Score Popularity`,
	max(Popularity_Score) as `Max Score Popularity`
from `rama adi`.trends_dataset;

-- AVG Popularity tiap trend status
select Trend_Status,
	round(avg(Popularity_Score), 2) as 'AVG Nilai Popularity'
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

# dari hasil diperoleh Trending tidak memiliki nilai yg cukup tinggi sehingga dapat dilihat bahwa dg nilai popularity score yg tinggi belum tentu menjadi trending.

# 2. Apakah Customer rating yang tinggi berpengaruh terhadap trending 
select Trend_Status,
	round(avg(Customer_Rating), 2) as `AVG Customer Rating`
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

# Diperoleh hasil bahwa suatu produk bisa trending karena memiliki customer rating yang tinggi. diperjelas dengan kode di bawah.

select Category,
	Customer_Rating,
	Trend_Status,
    round(avg(Customer_Rating) over(partition by Trend_Status), 2) as `AVG Customer Rating`
from `rama adi`.trends_dataset
order by 3 desc;

# 3. Apakah produk trending karena harganya murah
select Trend_Status,
	round(avg(`Price(USD)`), 2) as `AVG Price`
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

# dapat dilihat bahwa produk yang trending justru memiliki rata-rata harga yg lebih mahal dr pd lainnya. sehingga yg murah belum tentu trending. 

# 4. Apakah Warna terntu menjadi sebuah trending
with cte as(
	select Trend_Status,
		Color,
		count(*) as Jumlah,
		dense_rank() over(partition by Trend_Status order by count(*) desc) as `Ranking Most Buying`
	from `rama adi`.trends_dataset
	group by 1, 2
)
select *
from cte
where `Ranking Most Buying` <= 2
order by Trend_Status, Jumlah desc;

select color,
	count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

# dari hasil dapat disimpulkan bahwa Beige menjadi warna favorit untuk dibeli ketika trending 

# 5. Apakah material tertentu menjadi sebuah trending
select Material,
	Trend_Status,
    count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1, 2
order by 2, 3 desc;

select Material,
    count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

select Season,
	Material,
    count(*) as Jumlah
from `rama adi`.trends_dataset
where Trend_Status = 'Trending'
group by 1, 2
order by 1, 3 desc;

# diperoleh hasil bahwa material dg bahan leather dominan trending namun masih banyak pertimbangan lainnya karena dari season material yg digunakan berbeda-beda. 

# 6. Apakah style terentu dapat menjadikan sebuah produk menjadi trending
select Style,
	count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

select Style,
	Trend_Status,
	count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1, 2
order by 2, 3 desc;

Select Season, 
	Style,
    Trend_Status,
    count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1, 2, 3
order by 1, 3, 4 desc;

# luxury menjadi style paling banyak digunakan ketika trending tetapi style sporty dengan trend Outdated memiliki jumlah yg banyak pemakainya. tidak dapat disimpulkan style menjadi penyebab trending.

# 7. Apakah Brand berpengaruh terhadap trending suatu produk
select Brand,
	count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1
order by 2 desc;

select Trend_Status,
    Brand,
    count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1, 2
order by 1,  3 desc;

# dapat diketahui bahwa H&M menjadi  brand paling banyak dibeli ketika trending, namun Mango menjadi Brand yg plg banyak dibeli secara keseluruhan dan Outdated. Jadi belum tentu Brand yg paling banyak dibeli menjadi trending.

# 8. Apakah Combinasi color, material dan Brand bisa menyebabkan trending
select Color,
	Material,
    Brand,
    Trend_Status,
    count(*) as Jumlah
from `rama adi`.trends_dataset
where Trend_Status = 'Trending'
group by 1,2,3,4
order by 4, 5 desc;

# tidak ada combinasi yang tepat atau seusai dengan hasil yg sudah ada.

# 9. Combinasi Brand dan Color
select Brand,
	Color,
	Trend_Status,
    count(*) as Jumlah
from `rama adi`.trends_dataset
group by 1, 2, 3
order by 1, 3, 4 desc;

select Brand,
	Color,
    count(*) as Jumlah
from `rama adi`.trends_dataset
where Trend_Status = 'Trending'
group by 1, 2
order by 1, 3 desc;

# dari hasil diperoleh bahwa Brad H&M dengan Color Beige menjadi produk yang banyak dibeli ketika trending

# 10. Apakah Season menyebabkan trending?
select Trend_Status,
	Season,
    count(*) as 'Total Sold'
from `rama adi`.trends_dataset
group by 1, 2
order by 1, 3 desc;

# ->> JADI, dapat disimpulkan secara keseluruhan bahwa Customer Rating yang tinggi menjadi penyebab suatu produk bisa trending.