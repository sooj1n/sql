
-- HR_DEPARTMENT 회사의 부서 정보
-- HR_EMPLOYEES 회사의 사원 정보
-- HR_GRADE 사원의 평가 정보

-- 사원별 성과금 정보를 조회
-- 평가 점수별 등급과 등급에 따른 성과금 정보가 아래와 같을 때, 사번, 성명, 평가 등급, 성과금을 조회

WITH CTE AS (
    SELECT
        DISTINCT EMP_NO
        ,CASE
            WHEN AVG(SCORE) OVER(PARTITION BY EMP_NO) >= 96
                THEN 'S'
            WHEN AVG(SCORE) OVER(PARTITION BY EMP_NO) >= 90
                THEN 'A'
            WHEN AVG(SCORE) OVER(PARTITION BY EMP_NO) >= 80
                THEN 'B'
            ELSE 'C'
        END AS 'GRADE'
    FROM
        HR_GRADE
)

SELECT CTE.EMP_NO
    ,EMP_NAME
    ,GRADE
    ,CASE GRADE
        WHEN 'S'
            THEN SAL * 0.2
        WHEN 'A'
            THEN SAL * 0.15
        WHEN 'B'
            THEN SAL * 0.10
        WHEN 'C'
            THEN SAL * 0
        ELSE NULL
    END AS BONUS
FROM CTE
    INNER JOIN HR_EMPLOYEES AS e
        ON CTE.EMP_NO = e.EMP_NO
ORDER BY CTE.EMP_NO ASC


========================================== 


with cte as (
    select 
        e.EMP_NO,
        e.EMP_NAME,
        AVG(SCORE) as score,
        E.SAL
    from HR_EMPLOYEES e
    join HR_GRADE g on e.EMP_NO=g.EMP_NO
    Group by e.EMP_NO
),
cte2 as (
    select 
        EMP_NO,
        EMP_NAME,
        CASE 
        WHEN score >=96 THEN 'S'
        WHEN score >=90 THEN 'A'
        WHEN score >=80 THEN 'B'
        ELSE 'C'
        END as GRADE,
        SAL
    from cte
)

select 
    EMP_NO,
    EMP_NAME,
    GRADE,
    CASE 
        WHEN GRADE='S' THEN SAL*0.2
        WHEN GRADE='A' THEN SAL*0.15
        WHEN GRADE='B' THEN SAL*0.1
        ELSE SAL*0
    END as BONUS
from cte2
order by EMP_NO
