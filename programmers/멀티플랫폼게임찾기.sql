-- games와 platforms 테이블 이너조인 on g.platform_id = p.platform_id
-- 게임 한 개 당 플랫폼 개수가 2개 이상인 groupby(count)
-- 2012년 이후 출시games.year
with
  g AS (
    select
      games.name as gname,
      CASE
        WHEN platforms.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 'Sony'
        WHEN platforms.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 'Nintendo'
        WHEN platforms.name IN ('X360', 'XONE') THEN 'Microsoft'
      END AS Pname,
      games.year as year
    from
      games
      join platforms on games.platform_id = platforms.platform_id
    where
      games.year >= 2012
  )
select DISTINCT gname as name
from
  g
where Pname is NOT null
group by
  gname
having
  count(DISTINCT Pname) >= 2
