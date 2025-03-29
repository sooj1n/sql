-- 회원 정보를 담은 USER_INFO
-- 상품 판매 정보를 담은 ONLINE_SALE
-- 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 
-- 상품을 구매한 회원의 비율
-- (=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)

################ SELECT 서브쿼리 #######################
select
    YEAR(SALES_DATE) as YEAR,
    MONTH(SALES_DATE) as MONTH,
    count(DISTINCT u.USER_ID) as PURCHASED_USERS,
    round(count(DISTINCT u.USER_ID)/(select count(USER_ID) as total 
                            from USER_INFO 
                            where YEAR(joined)=2021),1) as PUCHASED_RATIO
from USER_INFO u
join ONLINE_SALE s on u.USER_ID=s.USER_ID
WHERE s.USER_ID IN (SELECT USER_ID FROM USER_INFO WHERE YEAR(JOINED) = 2021)
Group by YEAR(SALES_DATE),MONTH(SALES_DATE)
order by 1,2


