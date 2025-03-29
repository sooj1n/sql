-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보
-- ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보
-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.

SELECT o.ANIMAL_ID, o.NAME
From ANIMAL_INS i
right outer join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
where i.ANIMAL_ID IS NULL
order by 1 
