-- 실험실에서 배양한 대장균들의 정보를 담은 ECOLI_DATA
-- 각 분기(QUARTER)별 분화된 대장균의 개체의 총 수(ECOLI_COUNT)를 출력하는 SQL 문을 작성해주세요. 이때 각 분기에는 'Q' 를 붙이고 분기에 대해 오름차순으로 정렬해주세요. 대장균 개체가 분화되지 않은 분기는 없습니다.

select 
    CASE
    WHEN MONTH(DIFFERENTIATION_DATE) between 1 and 3 Then '1Q'
    WHEN MONTH(DIFFERENTIATION_DATE) between 4 and 6 Then '2Q'
    WHEN MONTH(DIFFERENTIATION_DATE) between 7 and 9 Then '3Q'
    WHEN MONTH(DIFFERENTIATION_DATE) between 10 and 12 Then '4Q' 
    END AS QUARTER,
    count(ID) as ECOLI_COUNT
from ECOLI_DATA
group by QUARTER
order by QUARTER
