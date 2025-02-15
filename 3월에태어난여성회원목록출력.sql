-- 코드를 입력하세요
-- 조건1) 3월생 여성
-- 조건2) 전화번호 NULL이 아님
-- 조건3) 회원ID 기준 오름차순 정렬

# SELECT MEMBER_ID,
#        MEMBER_NAME,
#        GENDER,
#        DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
# FROM MEMBER_PROFILE
# WHERE MONTH(DATE_OF_BIRTH) = 3
# AND GENDER = 'W'
# AND TLNO IS NOT NULL
# ORDER BY MEMBER_ID

with birth as(
    SELECT 
        MEMBER_ID, 
        MEMBER_NAME, 
        TLNO, 
        GENDER, 
        DATE_OF_BIRTH,
        MONTH(DATE_OF_BIRTH) as month
    FROM MEMBER_PROFILE
    )
select
    MEMBER_ID,
    MEMBER_NAME,
    GENDER,
    DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') as DATE_OF_BIRTH
from birth
where (TLNO IS NOT NULL) and (month=3) and (GENDER='W')
order by MEMBER_ID
