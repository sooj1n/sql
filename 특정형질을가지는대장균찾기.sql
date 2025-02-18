-- 2번 형질이 보유하지 않으면서 1번이나 3번 형질을 보유하고 있는 대장균 개체
-- 2번 형질x ==> GENOTYPE&2=0
-- 1번 형질0 ===> GENOTYPE&1!=0
-- 3번 형질0 ===> GENOTYPE&4!=0
-- 8421


select count(ID) as COUNT
from ECOLI_DATA
where GENOTYPE&2=0 and (GENOTYPE&1!=0 or GENOTYPE&4!=0)
