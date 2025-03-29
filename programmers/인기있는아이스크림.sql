-- 총주문량을 기준으로 내림차순 정렬, 같다면 출하 번호를 기준으로 오름차순 정렬
-- 조회 컬럼이 1개니까 정렬 설정할 때 숫자로 안됨

SELECT FLAVOR
FROM FIRST_HALF
order by TOTAL_ORDER desc, SHIPMENT_ID asc
