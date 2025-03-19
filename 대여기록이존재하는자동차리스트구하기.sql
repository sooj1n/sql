-- 대여 중인 자동차들의 정보를 담은 CAR_RENTAL_COMPANY_CAR
-- 자동차 대여 기록 정보를 담은 CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차 ID 리스트를 출력하는 SQL문을 작성해주세요.
SELECT distinct c.CAR_ID
from CAR_RENTAL_COMPANY_CAR c
join CAR_RENTAL_COMPANY_RENTAL_HISTORY h on c.car_id=h.car_id
where c.car_type='세단' and MONTH(h.start_date)=10
order by 1 desc
