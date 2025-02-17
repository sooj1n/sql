-- 대장균 개체의 크기를 내름차순으로 정렬
-- 0% ~ 25% CRITICAL 
-- 26% ~ 50% HIGH
-- 51% ~ 75% MEDIUM
-- 76% ~ 100% LOW
-- ID 에 대해 오름차순

select 
    ID,
    SIZE_OF_COLONY,
    -- DENSE_RANK() OVER (order by SIZE_OF_COLONY desc) 동일 순위로 나타남
    ROW_NUMBER() OVER (order by SIZE_OF_COLONY desc) as RANK
from ECOLI_DATA 
order by SIZE_OF_COLONY desc
