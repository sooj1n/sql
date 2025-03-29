-- sprint 3/1 ~ 5/31
-- summer 6/1 ~ 8/31
-- autumn 9/1 ~ 11/30
-- winter 12/1 ~ 2/29'
-- 계절 별 미세먼지 농도의 중앙값과 평균
-- 
with
  season as (
    select
      measured_at,
      CASE
        WHEN CAST(STRFTIME ('%m', measured_at) AS INTEGER) BETWEEN 3 AND 5  THEN 'spring'
        WHEN CAST(STRFTIME ('%m', measured_at) AS INTEGER) BETWEEN 6 AND 8  THEN 'summer'
        WHEN CAST(STRFTIME ('%m', measured_at) AS INTEGER) BETWEEN 9 AND 11  THEN 'autumn'
        WHEN CAST(STRFTIME ('%m', measured_at) AS INTEGER) = 12
        OR CAST(STRFTIME ('%m', measured_at) AS INTEGER) BETWEEN 1 AND 2  THEN 'winter'
        ELSE 'unknown'
      END AS season,
      pm10
    from
      measurements
  )
select
  season,
  median (pm10) as pm10_median,
  round(avg(pm10),2) as pm10_average
from
  season
group by
  season
