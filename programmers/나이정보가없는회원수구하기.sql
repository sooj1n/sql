-- 나이 정보가 없는 회원이 몇 명

select count(user_id) as USERS
from USER_INFO
where AGE IS NULL
