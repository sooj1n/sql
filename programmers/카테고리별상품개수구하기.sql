-- 상품 카테고리 코드(PRODUCT_CODE 앞 2자리) 별 상품 개수를 출력
## 문자열 자르기 SUBSTR(column, 시작 위치, 개수)
SELECT 
    SUBSTR(PRODUCT_CODE,1,2) as CATEGORY,
    count(PRODUCT_ID) as PRODUCTS
FROM PRODUCT
group by CATEGORY
order by 1 
