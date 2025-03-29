-- 동물 보호소에 들어온 동물의 정보 ANIMAL_INS
-- 동물 보호소에서 입양 보낸 동물의 정보 ANIMAL_OUTS
-- SEX_UPON_INTAKE / SEX_UPON_OUTCOME  성별 및 중성화 여부
-- 보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물
-- Spayed Female 중성화0
-- Neutered Male 중성화 0
-- Intact Male/Intact Female 중성화x


select i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME
from ANIMAL_INS i
join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
where (i.SEX_UPON_INTAKE='Intact Male' or i.SEX_UPON_INTAKE='Intact Female') and (o.SEX_UPON_OUTCOME='Spayed Female' or o.SEX_UPON_OUTCOME='Neutered Male')
