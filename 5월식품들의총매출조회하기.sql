-- 식품의 정보를 담은 FOOD_PRODUCT
-- 식품의 주문 정보를 담은 FOOD_ORDER

-- 생산일자가 2022년 5월인 식품
-- 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬

select p.PRODUCT_ID,PRODUCT_NAME,sum(AMOUNT*PRICE) as TOTAL_SALES
from FOOD_ORDER o
join FOOD_PRODUCT p on o.PRODUCT_ID=p.PRODUCT_ID
WHERE YEAR(o.PRODUCE_DATE) = 2022 AND MONTH(o.PRODUCE_DATE) = 5
GROUP BY p.PRODUCT_ID
order by 3 desc, 1 asc
