-- 3세대의 대장균의 ID(ID) 를 출력

with F as(
select ID as F_ID
from ECOLI_DATA
where PARENT_ID IS NULL
),
S as(
select ID as S_ID
from ECOLI_DATA s 
join F f on s.PARENT_ID=f.F_ID
)

select ID
from ECOLI_DATA t
join S s on t.PARENT_ID=s.S_ID
order by ID
