-- 멘티 : 2021-09-31 이후 입사자
-- 멘토 : 2019-12-31 이후 입사자
-- 서로 다른 부서끼리 멘토링
-- 매칭 가능한 멘토가 없는 경우도 모두 포함
with
  mentee AS (
    select
      *
    from
      employees
    where
      join_date >= '2021-09-31'
  ),
  mento AS (
    select
      *
    from
      employees
    where
      join_date <= '2019-12-31'
  )
SELECT mentee.employee_id as mentee_id, mentee.name as mentee_name, mento.employee_id as mentor_id, mento.name as mentor_name from mentee full outer join mento on mentee.department!=mento.department
