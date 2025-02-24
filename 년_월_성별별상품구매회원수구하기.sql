-- 회원 정보를 담은 USER_INFO
-- 상품 판매 정보를 담은 ONLINE_SALE
-- 년, 월, 성별 별로 상품을 구매한 회원수를 집계
-- 년, 월, 성별을 기준으로 오름차순 정렬
-- 성별 정보가 없는 경우 결과에서 제외

** count(DISTINCT u.USER_ID) as USERS
중복된 회원이 여러 번 구매했더라도 한 번만 집계되도록 

select YEAR(SALES_DATE) as YEAR, MONTH(SALES_DATE) as MONTH, gender as GENDER, count(DISTINCT u.USER_ID) as USERS
from USER_INFO u
join ONLINE_SALE s on u.USER_ID=s.USER_ID
WHERE u.gender IS NOT NULL
group by YEAR(SALES_DATE), MONTH(SALES_DATE), gender
order by YEAR(SALES_DATE), MONTH(SALES_DATE), gender
