-- 100 이하라면 'LOW'
-- 100 초과 1000 이하라면 'MEDIUM'
-- 1000 초과라면 'HIGH'
-- ID 에 대해 오름차순

-- CASE WHEN 구문 조건 여러개

select 
    ID,
    CASE 
    WHEN SIZE_OF_COLONY<=100 THEN 'LOW'
    WHEN SIZE_OF_COLONY BETWEEN 100 and 1000 THEN 'MEDIUM'
    WHEN SIZE_OF_COLONY>1000 THEN 'HIGH'
    END as SIZE
from ECOLI_DATA
