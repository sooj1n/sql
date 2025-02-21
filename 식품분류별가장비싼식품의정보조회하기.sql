-- 식품분류별로 가격이 제일 비싼 식품 (CATEGORY)
-- 식품분류가 '과자', '국', '김치', '식용유'인 경우
-- 식품 가격을 기준으로 내림차순
-- HAVING은 GROUP BY 이후의 결과를 필터링하는 데 사용되므로, 보통 WHERE 절에서 필터링하는 것이 더 적절합니다.
--  MAX(PRICE)는 각 카테고리별 최고 가격을 가져오지만, PRODUCT_NAME은 어떤 기준으로 선택될지 알 수 없습니다.


===
카테고리와 MAX(PRICE)는 Groupby category와 관련한 부분들이지만 이름은 아니기 때문에 SELECT CATEGORY, MAX(PRICE) as MAX_PRICE, PRODUCT_NAME 처음부터 이렇게 하면 안됨
===

WITH MAX_PRICE_PER_CATEGORY AS (
    SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY REGEXP '과자|국|김치|식용유'
    GROUP BY CATEGORY
)
SELECT F.CATEGORY, M.MAX_PRICE, F.PRODUCT_NAME
FROM FOOD_PRODUCT F
JOIN MAX_PRICE_PER_CATEGORY M
ON F.CATEGORY = M.CATEGORY AND F.PRICE = M.MAX_PRICE
ORDER BY M.MAX_PRICE DESC;

