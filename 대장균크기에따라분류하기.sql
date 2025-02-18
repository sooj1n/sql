-- 대장균 개체의 크기를 내름차순으로 정렬
-- 0% ~ 25% CRITICAL 
-- 26% ~ 50% HIGH
-- 51% ~ 75% MEDIUM
-- 76% ~ 100% LOW
-- ID 에 대해 오름차순

-- DENSE_RANK() OVER (order by SIZE_OF_COLONY desc) 동일 순위로 나타남
-- ROW_NUMBER() OVER (order by SIZE_OF_COLONY desc) as rank
-- RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS `rank`
-- 하지만 RANK()는 동일한 크기의 개체들이 있을 경우, 예상한 퍼센트 구간에 정확히 들어가지 않을 수 있음.
-- NTILE(4)로 데이터를 균등한 4개 그룹으로 나눔

---------------------
RANK를 사용했던 답안

# WITH ranking AS (
#     SELECT 
#         ID,
#         SIZE_OF_COLONY,
#         RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS `rank`
#     FROM ECOLI_DATA
# ), total AS (
#     SELECT COUNT(*) AS total_count FROM ECOLI_DATA
# )
# SELECT 
#     r.ID,
#     CASE 
#         WHEN r.`rank` BETWEEN 1 AND CEIL(t.total_count * 0.25) THEN 'CRITICAL'
#         WHEN r.`rank` BETWEEN CEIL(t.total_count * 0.26) AND CEIL(t.total_count * 0.5) THEN 'HIGH'
#         WHEN r.`rank` BETWEEN CEIL(t.total_count * 0.51) AND CEIL(t.total_count * 0.75) THEN 'MEDIUM'
#         WHEN r.`rank` BETWEEN CEIL(t.total_count * 0.76) AND t.total_count THEN 'LOW'
#     END AS COLONY_NAME
# FROM ranking r, total t
# ORDER BY r.ID;
----------------------------


SELECT ID,
    CASE 
        WHEN SizeRank = 1 THEN 'CRITICAL'
        WHEN SizeRank = 2 THEN 'HIGH'
        WHEN SizeRank = 3 THEN 'MEDIUM'
        WHEN SizeRank = 4 THEN 'LOW'
    END AS COLONY_NAME
FROM 
    (
    SELECT 
        ID,
        SIZE_OF_COLONY,
        NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) AS SizeRank
    FROM 
        ECOLI_DATA
) as RankedColony
ORDER BY ID;
