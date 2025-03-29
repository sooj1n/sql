-- FISH_INFO 테이블은 잡은 물고기들의 정보
-- 2021년도에 잡은 물고기 수를 출력


select count(ID) as FISH_COUNT
from FISH_INFO
where YEAR(TIME)=2021
