-- CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차
-- 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수
-- 정렬 월 asc > ID Desc
-- 총 대여 횟수가 0인 경우에는 결과에서 제외
----------------------------------------------
2중 그룹바이 가능:
---------------------------------------------

WITH CAR_RENTAL_COUNT AS (
    -- 자동차 ID별 전체 대여 횟수 계산
    SELECT CAR_ID, COUNT(HISTORY_ID) AS TOTAL_RENTALS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(HISTORY_ID) >= 5
)

-- 조건을 만족하는 자동차들만 필터링하여 월별 대여 횟수 계산
SELECT 
    MONTH(START_DATE) AS MONTH, 
    C.CAR_ID, 
    COUNT(H.HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
JOIN CAR_RENTAL_COUNT C ON H.CAR_ID = C.CAR_ID
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(START_DATE), H.CAR_ID
ORDER BY MONTH ASC, CAR_ID DESC;

