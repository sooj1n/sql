-- 쇼핑몰 상품 정보를 담은 PRODUCT 
-- 오프라인 상품 판매 정보를 담은 OFFLINE_SALE
-- PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력

select PRODUCT_CODE, sum(SALES_AMOUNT)*price as SALES
from OFFLINE_SALE o
join PRODUCT p on o.PRODUCT_ID=p.PRODUCT_ID
group by PRODUCT_CODE 
order by 2 desc, 1
