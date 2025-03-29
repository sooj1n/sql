-- sido (경기도)
-- sigungu (성남시)
-- cnt(경기도 성남시 개수)
with
  addr as (
    select
      substr(address, 0, instr(address, ' ')) as sido,
      substr(substr(address, instr(address, ' ')),1,instr(substr(address, instr(address, ' ') + 1), ' ')) as sigungu
    from
      cafes
  )
select
  trim(sido),
  trim(sigungu),
  count(*) as cnt
from
  addr
group by
  sido,
  sigungu
order by
  cnt desc
