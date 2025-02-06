WITH
  calc_usage AS (
    SELECT
      station_id, -- groupby 대상 컬럼(첫 번째)
      sum(CASE WHEN substr(rental_time, 1, 4) = '2018' THEN 1 ELSE NULL END) usage_2018, -- 2018년 대여 개수
      sum(CASE WHEN substr(rental_time, 1, 4) = '2019' THEN 1 ELSE NULL END) usage_2019 -- 2019년 대여 개수
    FROM (
      -- 대여시간과 대여 정류소(2018-10, 2019-10 데이터)
      SELECT
        rent_at rental_time,
        rent_station_id station_id
      FROM rental_history
      WHERE
        substr(rent_at, 1, 7) in ('2018-10', '2019-10')
      UNION ALL  -- 유니온 결과 컬럼: 대여시간, 대여정류소, 반납시간, 반납정류소
      -- 반납시간과 반납 정류소(2018-10, 2019-10 데이터)
      SELECT
        return_at rental_time,
        return_station_id station_id
      FROM rental_history
      WHERE
        substr(rent_at, 1, 7) in ('2018-10', '2019-10')
    )
    -- 첫 번째 컬럼을 기준으로 그룹화 (station_id)
    GROUP BY 1
  )

SELECT
  station_id,
  name,
  local,
  round(100.0 * usage_2019 / usage_2018, 2) usage_pct
FROM calc_usage
LEFT JOIN station USING (station_id)
WHERE
  usage_2019 / usage_2018 IS NOT NULL
  AND round(100.0 * usage_2019 / usage_2018, 2) <= 50
