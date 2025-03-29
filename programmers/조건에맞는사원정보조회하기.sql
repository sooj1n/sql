-- HR_DEPARTMENT 회사의 부서 정보
-- HR_EMPLOYEES 회사의 사원 정보
-- HR_GRADE 사원의 평가 정보

-- 2022년도 한해 평가 점수가 가장 높은 사원 정보를 조회
-- 2022년도의 평가 점수는 상,하반기 점수의 합 
-- 점수, 사번, 성명, 직책, 이메일

select 
    sum(SCORE) as SCORE,
    e.EMP_NO,
    e.EMP_NAME,
    e.POSITION,
    e.EMAIL
from HR_EMPLOYEES e
join HR_GRADE g on e.EMP_NO=g.EMP_NO
group by e.EMP_NO
order by SCORE desc
Limit 1
