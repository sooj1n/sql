-- ONLINE_SALE : 온라인 상품 판매 정보
-- OFFLINE_SALE : 오프라인 상품 판매 정보
-- 2022년 3월 데이터 출력
-- OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시
-- 정렬: 판매일 asc > 상품 ID asc > 유저 ID asc

-------------
1) 조건 없이 두 테이블 합치기 ==> union
2) union 할 때 컬럼 수 일치시키기 => select문에 NULL AS USER_ID 이런식으로 추가
3) 정렬은 가장 마지막에
--------------

SELECT DATE_FORMAT(SALES_DATE,'%Y-%m-%d') as SALES_DATE ,PRODUCT_ID,USER_ID,SALES_AMOUNT
FROM ONLINE_SALE
WHERE YEAR(SALES_DATE)=2022 and MONTH(SALES_DATE)=3
UNION
SELECT DATE_FORMAT(SALES_DATE,'%Y-%m-%d') as SALES_DATE,PRODUCT_ID, NULL AS USER_ID,SALES_AMOUNT
FROM OFFLINE_SALE
WHERE YEAR(SALES_DATE)=2022 and MONTH(SALES_DATE)=3
ORDER BY SALES_DATE asc ,PRODUCT_ID asc ,USER_ID asc



