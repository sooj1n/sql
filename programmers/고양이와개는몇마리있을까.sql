-- 고양이와 개가 각각 몇 마리인지 조회
-- 고양이를 개보다 먼저 조회해주세요.
SELECT ANIMAL_TYPE, count(ANIMAL_ID) as count
FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE 
