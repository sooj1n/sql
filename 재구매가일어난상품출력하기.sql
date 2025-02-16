-- 동일한 회원이 동일한 상품을 재구매한 데이터
-- 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 내림차순

SELECT USER_ID,PRODUCT_ID
FROM ONLINE_SALE
GROUP BY user_id,product_id
HAVING COUNT(USER_ID) >= 2
ORDER BY user_id asc, product_id desc

