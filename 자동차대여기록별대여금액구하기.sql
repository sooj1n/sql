-- 대여 중인 자동차들의 정보를 담은 CAR_RENTAL_COMPANY_CAR
-- 자동차 대여 기록 정보를 담은 CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- 자동차 종류 별 대여 기간 종류 별 할인 정책 정보를 담은 CAR_RENTAL_COMPANY_DISCOUNT_PLAN
-- 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문을 작성해주세요. 
with f as 
(SELECT 
    HISTORY_ID,
    (DATEDIFF(END_DATE,START_DATE)+1) as dd,
    case 
    when (DATEDIFF(END_DATE,START_DATE)+1)>=90 then '90일 이상'
    when (DATEDIFF(END_DATE,START_DATE)+1)>=30 then '30일 이상'
    when (DATEDIFF(END_DATE,START_DATE)+1)>=7 then '7일 이상'
    else '해당없음'
    end as type,
    DAILY_FEE
From CAR_RENTAL_COMPANY_CAR c
Join CAR_RENTAL_COMPANY_RENTAL_HISTORY h on c.CAR_ID=h.CAR_ID
where CAR_TYPE='트럭'),
truck as(
select *
from CAR_RENTAL_COMPANY_DISCOUNT_PLAN
where CAR_TYPE='트럭')

select 
    HISTORY_ID,
    round(case when discount_rate IS NOT NULL then (DAILY_FEE*((100-DISCOUNT_RATE)*0.01))*dd
    else DAILY_FEE*dd end) as FEE
from f
left join truck on f.TYPE=truck.DURATION_TYPE
Order by 2 desc, 1 desc


