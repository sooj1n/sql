-- 부서별 평균 연봉을 조회
-- 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL
-- 부서별 평균 연봉을 기준으로 내림차순 정렬

select d.DEPT_ID, d.DEPT_NAME_EN, round(AVG(SAL)) as AVG_SAL
from HR_EMPLOYEES e
join HR_DEPARTMENT d on d.DEPT_ID=e.DEPT_ID
group by d.DEPT_ID
order by AVG_SAL desc
