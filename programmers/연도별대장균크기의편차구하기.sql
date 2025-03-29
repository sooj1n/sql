-- 분화된 연도별  크기의 편차, 대장균 개체의 ID
-- 편차 : 가장 큰 대장균의 크기 - 각 대장균의 크기
-- 정렬 : 연도 > 편차
with maxsize as (
    select YEAR(DIFFERENTIATION_DATE) as YEAR, MAX(SIZE_OF_COLONY) as MAX_SIZE
    from ECOLI_DATA
    group by YEAR(DIFFERENTIATION_DATE)
)

select 
    ms.YEAR,
    MAX_SIZE-SIZE_OF_COLONY AS YEAR_DEV,
    ID
from ECOLI_DATA ed
join maxsize ms on YEAR(ed.DIFFERENTIATION_DATE)=ms.YEAR
order by year,YEAR_DEV
