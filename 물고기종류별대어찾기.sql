-- 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문코드를 작성해주세요
--  물고기의 ID에 대해 오름차순 정렬

with m_l as ( 
    SELECT 
    FISH_TYPE, 
    MAX(LENGTH) AS MAX_LENGTH
FROM FISH_INFO
GROUP BY FISH_TYPE)


select ID,FISH_NAME,MAX_LENGTH as LENGTH
from FISH_INFO fi
join m_l on (fi.LENGTH=m_l.MAX_LENGTH) and (fi.FISH_TYPE=m_l.FISH_TYPE)
join FISH_NAME_INFO fni on m_l.FISH_TYPE=fni.FISH_TYPE
order by ID


==================================
ROW_NUMBER() 사용방법
==================================
WITH Ranked_Fish AS (
    SELECT 
        ID, 
        FISH_NAME, 
        FISH_TYPE, 
        LENGTH, 
        ROW_NUMBER() OVER (PARTITION BY FISH_TYPE ORDER BY LENGTH DESC, ID ASC) AS rnk
    FROM FISH_INFO
)
SELECT 
    ID, 
    FISH_NAME, 
    LENGTH
FROM Ranked_Fish
WHERE rnk = 1
ORDER BY ID;

