-- 동물 보호소에 들어온 동물의 정보 ANIMAL_INS
-- 동물 보호소에서 입양 보낸 동물의 정보 ANIMAL_OUTS
-- 아직 입양을 못 간 동물 중 I outer left join o 
-- 가장 오래 보호소에 있었던 동물 3마리


=================
a 테이블 차집합 공식
select *
from a
left join b on a.key=b.key
where b.key IS NULL
==================

select i.NAME, i.DATETIME
from ANIMAL_INS i
left join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
where o.ANIMAL_ID IS NULL
order by i.DATETIME asc
limit 3
