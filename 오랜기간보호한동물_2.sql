-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보
-- ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보
-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리

# ******* DATEDIFF *******


SELECT o.ANIMAL_ID, o.NAME
from ANIMAL_INS i
join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
order by DATEDIFF(o.DATETIME,i.DATETIME)+1 desc
limit 2
