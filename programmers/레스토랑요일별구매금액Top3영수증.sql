-- 요일 별 큰 금액을 결제한 영수증 top3
-- DENSE_RANK() 사용
-- day 그룹별 (PARTITION BY day) 
-- 매출이 높은 순서대로 번호를 매김 (order by total_bill DESC)
-- cf) ROW_NUMBER() 동일한 값이 있을 때 하나만 출력
-- ROW_NUMBER() : $10, $9, $9, $8, $5, $2 ==> $10, $9, $8 출력
-- DENSE_RNAK() : $10, $9, $9, $8, $5, $2 ==> $10, $9, $9, $8 출력

WITH RankedBill AS (
  SELECT
    day,
    total_bill,
    time,
    sex,
    DENSE_RANK() OVER (PARTITION BY day ORDER BY  total_bill DESC) AS rn
  FROM
    tips
  )
SELECT
  day,
  total_bill,
  time,
  sex
FROM
  RankedBill
WHERE
  rn <= 3;
