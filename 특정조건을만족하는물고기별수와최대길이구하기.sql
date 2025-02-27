-- 평균 길이가 33cm 이상인 물고기들을 종류별로 분류
-- 잡은 수, 최대 길이, 물고기의 종류를 출력
-- 물고기 종류에 대해 오름차순으로 정렬
-- 10cm이하의 물고기들은 10cm로 취급하여 평균 길이를 구해주세요.

with cte as (
    select
        ID,
        FISH_TYPE,
        CASE WHEN LENGTH IS NULL THEN 10 ELSE LENGTH END as LENGTH,
        TIME
    from FISH_INFO
    )

Select count(ID) as FISH_COUNT, max(LENGTH) as MAX_LENGTH, FISH_TYPE
from cte
group by FISH_TYPE
having avg(LENGTH)>=33
order by FISH_TYPE

