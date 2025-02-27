-- 물고기의 종류 별 물고기의 이름과 잡은 수를 출력
--  잡은 수 기준으로 내림차순 정렬

select count(ID) as FISH_COUNT, FISH_NAME
from FISH_INFO i
join FISH_NAME_INFO n on i.FISH_TYPE=n.FISH_TYPE
group by FISH_NAME
order by FISH_COUNT desc
