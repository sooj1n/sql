-- CAR_RENTAL_COMPANY_CAR
-- '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차
--  종류 별로 몇 대인지 출력 (Type)

---------------
LIKE 간단하게 ==> REGEXP

OPTIONS LIKE '%통풍시트%' Or OPTIONS LIKE '%열선시트%' or OPTIONS LIKE '%가죽시트%'
=> WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트';
--------------------------------------------------------


SELECT CAR_TYPE, count(car_id) as CARS
from CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
group by car_type
order by car_type

