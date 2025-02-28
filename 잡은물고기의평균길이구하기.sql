-- 잡은 물고기의 평균 길이를 출력

with cte as(
    select 
        CASE WHEN LENGTH IS NULL THEN 10 ELSE LENGTH END as l
    from FISH_INFO
)

select round(avg(l),2) as AVERAGE_LENGTH
from cte


