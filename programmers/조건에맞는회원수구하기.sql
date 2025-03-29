-- 2021년에 가입한 회원 
-- 나이가 20세 이상 29세 이하
SELECT count(*) as USERS
FROM USER_INFO
WHERE YEAR(JOINED)=2021 and AGE between 20 and 29
