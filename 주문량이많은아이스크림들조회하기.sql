-- 상반기 주문 정보를 담은 FIRST_HALF
-- 7월의 아이스크림 주문 정보를 담은 JULY
-- JULY 테이블은 같은 맛이라도 다른 출하번호를 가지는 경우가 생겨서 groupby 사용

select h.FLAVOR
from FIRST_HALF h
left join (select FLAVOR,sum(TOTAL_ORDER) as total from JULY group by FLAVOR) as j on h.FLAVOR=j.FLAVOR
order by h.TOTAL_ORDER+j.total desc
limit 3

