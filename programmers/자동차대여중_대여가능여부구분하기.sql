-- CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- AVAILABILITY 컬럼추가 :
-- 2022년 10월 16일에 대여 중인 자동차인 경우 '대여중'
-- 대여 중이지 않은 자동차인 경우 '대여 가능'
-- 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'
-- ID를 기준으로 내림차순 정렬

--------------------------
그냥 대여중,대여가능이라고 컬럼을 표시하는 게 아니라
합산 결과가 1 이상이면 해당 자동차는 10월 16일에 대여 중 → '대여중' 출력.
합산 결과가 0이면 대여 기록 없음 → '대여 가능' 출력
----------------------------
SELECT 
    CAR_ID,
    CASE 
        WHEN SUM(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN 1 ELSE 0 END) > 0 
        THEN '대여중' 
        ELSE '대여 가능' 
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;


