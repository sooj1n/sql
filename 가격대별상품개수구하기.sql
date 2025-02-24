-- 만원 단위의 가격대 별로 상품 개수를 출력

## CEIL 가 아닌 FLOOR 인 이유
CEIL(price / 10000) * 10000을 사용하면 가격이 정확히 10,000, 20,000, 30,000원일 때 잘못된 그룹으로 분류될 수 있음.
FLOOR(price / 10000) * 10000을 사용하면 가격이 속하는 구간의 최소값(10,000원 단위)을 정확히 반환.


SELECT 
    FLOOR(PRICE / 10000) * 10000 AS PRICE_GROUP, 
    COUNT(PRODUCT_ID) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP;

