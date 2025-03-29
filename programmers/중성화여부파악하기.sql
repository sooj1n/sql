-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보
-- 중성화 => Spayed/Neutered

SELECT 
        ANIMAL_ID,
        NAME,
        case 
        when SEX_UPON_INTAKE LIKE '%Spayed%' or SEX_UPON_INTAKE LIKE '%Neutered%' then 'O'
        else 'X' end as '중성화'
FROM ANIMAL_INS
order by 1


======== LIKE 대신 REGEXP 사용하여 최적화 =========
WHEN SEX_UPON_INTAKE REGEXP 'Spayed|Neutered' THEN 'O'


