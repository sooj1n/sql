-- 이름이 없는 채로 들어온 동물의 ID
-- ID는 오름차순 정렬되어야 합니다.

SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NULL
ORDER BY ANIMAL_ID
