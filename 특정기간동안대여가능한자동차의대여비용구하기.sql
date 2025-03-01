-- 대여 중인 자동차들의 정보 CAR_RENTAL_COMPANY_CAR
-- 대여 기록 정보 CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- 할인 정책 정보 CAR_RENTAL_COMPANY_DISCOUNT_PLAN

-- 자동차 종류가 '세단' 또는 'SUV' /  2022년 11월 1일부터 2022년 11월 30일까지 대여 가능  /  30일간의 대여 금액이 50만원 이상 200만원 미만인 
-- 대여 금액을 기준으로 내림차순 정렬  > 자동차 종류를 기준으로 오름차순 > ID를 기준으로 내림차순 

######################################################################
LEFT JOIN을 사용했기 때문에, B.CAR_ID가 NULL이면 해당 기간 동안 대여되지 않은 차량임.
LEFT JOIN을 사용하여, 해당 자동차가 할인 정책이 없는 경우 NULL 값이 들어갈 수 있음.
######################################################################

SELECT * FROM
(
    SELECT A.CAR_ID ,A.CAR_TYPE ,ROUND((A.DAILY_FEE - (A.DAILY_FEE /100 * C.DISCOUNT_RATE)) * 30) AS FEE
    FROM CAR_RENTAL_COMPANY_CAR  A
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B ON A.CAR_ID = B.CAR_ID 
                                                     AND B.START_DATE <= '20221130' 
                                                     AND B.END_DATE >='20221101'
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN  C ON A.CAR_TYPE = C.CAR_TYPE AND DURATION_TYPE = '30일 이상'
    WHERE A.CAR_TYPE IN('SUV','세단')
    AND B.CAR_ID IS NULL
) A
WHERE A.FEE >=500000 AND A.FEE  <2000000
ORDER BY A.FEE DESC, A.CAR_TYPE ASC,A.CAR_ID DESC

