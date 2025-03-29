-- 동물 이름 중 두 번 이상 쓰인 이름, 횟수
-- 이름이 없는 동물은 집계에서 제외
-- 이름 순

SELECT NAME, COUNT(NAME) as COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING count(ANIMAL_ID)>=2
ORDER BY NAME
