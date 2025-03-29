-- 대장균 개체의 ID(ID)와 자식의 수(CHILD_COUNT)를 출력
-- 자식이 없다면 자식의 수는 0으로 출력
-- ID 에 대해 오름차순

-- LEFT JOIN **

select a.ID, count(b.ID) AS CHILD_COUNT
from ECOLI_DATA a
left join ECOLI_DATA b on a.ID=b.PARENT_ID
group by a.ID
ORDER BY ID
