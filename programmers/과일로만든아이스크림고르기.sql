-- 아이스크림 총주문량이 3,000보다 높음 & 주 성분이 과일
-- 총주문량이 큰 순서대로 조회

SELECT
    fh.FLAVOR
FROM FIRST_HALF fh
JOIN ICECREAM_INFO ii on fh.FLAVOR=ii.FLAVOR
where TOTAL_ORDER>=3000 and INGREDIENT_TYPE='fruit_based'
