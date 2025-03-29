-- 월별 잡은 물고기의 수와 월을 출력
-- 월을 기준으로 오름차순 정렬
-- 월은 숫자형태 (1~12) 로 출력하며 9 이하의 숫자는 두 자리로 출력하지 않습니다. 잡은 물고기가 없는 월은 출력하지 않습니다.

select count(ID) as FISH_COUNT ,  month(TIME) as MONTH
from FISH_INFO
group by MONTH
order by MONTH

