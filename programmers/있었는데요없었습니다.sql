-- 동물 보호소에 들어온 동물의 정보 ANIMAL_INS
-- 동물 보호소에서 입양 보낸 동물의 정보 ANIMAL_OUTS
-- 보호 시작일보다 입양일이 더 빠른 동물

SELECT i.ANIMAL_ID,i.NAME
from ANIMAL_INS i
join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
where i.DATETIME>o.DATETIME
order by i.DATETIME asc

