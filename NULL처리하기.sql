-- 이름이 없는 동물의 이름은 "No name"으로 표시

SELECT 
    ANIMAL_TYPE,
    CASE WHEN NAME IS NULL THEN 'No name' ELSE NAME END AS NAME,
    SEX_UPON_INTAKE
from ANIMAL_INS
