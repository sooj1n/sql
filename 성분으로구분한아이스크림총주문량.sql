-- 상반기 주문 정보를 담은 FIRST_HALF
-- 아이스크림 성분에 대한 정보를 담은 ICECREAM_INFO

select INGREDIENT_TYPE, sum(TOTAL_ORDER) as TOTAL_ORDER
from FIRST_HALF fh
join ICECREAM_INFO ii on fh.FLAVOR=ii.FLAVOR
group by INGREDIENT_TYPE
