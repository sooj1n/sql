-- 0시부터 23시
-- 각 시간대별로 입양이 몇 건이나 발생했는지 조회
-- 시간대 순으로 정렬 


# 특정 시간대에 입양 기록이 없는 경우 해당 시간이 결과에서 빠질 수 있습니다. 이를 해결하려면 시간대(023)를 포함하는 더미 테이블 또는 RECURSIVE CTE를 활용하여 023까지의 모든 시간을 포함하도록 보장해야 합니다.

# WITH RECURSIVE hours AS (...) 부분을 사용하여 0~23까지의 모든 시간을 생성
# LEFT JOIN을 통해 ANIMAL_OUTS 테이블과 조인하여 입양 건수를 집계
# COALESCE(COUNT(a.ANIMAL_ID), 0)를 사용하여 NULL 값을 0으로 변환


WITH RECURSIVE hours AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1 FROM hours WHERE HOUR < 23
)
SELECT 
    h.HOUR, 
    COALESCE(COUNT(a.ANIMAL_ID), 0) AS COUNT
FROM hours h
LEFT JOIN ANIMAL_OUTS a ON h.HOUR = HOUR(a.DATETIME)
GROUP BY h.HOUR
ORDER BY h.HOUR;

