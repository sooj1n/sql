-- 자동차 종류가 'SUV'
-- 평균 일일 대여 요금 / 소수 첫 번째 자리에서 반올림 / 컬럼명은 AVERAGE_FEE

-- 평균 AVG **

SELECT 
    round(AVG(daily_fee)) as AVERAGE_FEE
FROM 
    CAR_RENTAL_COMPANY_CAR
WHERE 
    car_type='SUV'
