-- 부모의 형질을 모두 보유한 대장균 출력
-- ID에 대해 오름차순
-- a.ID, a.PARENT_ID, a.GENOTYPE, b.GENOTYPE as P_GENOTYPE
-- 형질을 모두 보유하는 조건 where a.GENOTYPE & b.GENOTYPE = b.GENOTYPE

select a.ID, a.GENOTYPE, b.GENOTYPE as PARENT_GENOTYPE
from ECOLI_DATA a
left join ECOLI_DATA b on a.PARENT_ID=b.ID
where a.GENOTYPE & b.GENOTYPE = b.GENOTYPE
order by a.ID
