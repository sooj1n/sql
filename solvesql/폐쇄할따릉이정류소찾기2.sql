공유 자전거 서비스인 따릉이를 운영하는 팀에서는 지역별로 이용률이 감소하고 있는 따릉이 정류소를 폐쇄해 따릉이 서비스의 운영비용을 줄이려고 합니다. 따릉이 데이터를 다루는 당신은 정류소 정보가 담겨있는 station 테이블과 대여 기록이 담겨 있는 rental_history 테이블을 확인해 폐쇄를 검토할 따릉이 정류소 목록을 추려내는 업무를 받았습니다.

폐쇄할 정류소를 검토하기 위해 2019년 10월 한 달 동안 정류소에서 발생한 대여/반납 건수가 2018년 10월 같은 정류소에서 발생한 대여/반납 건수의 50% 이하인 정류소를 출력하는 쿼리를 작성해주세요. 2018년 10월 또는 2019년 10월 한 달간 대여/반납 건수가 0건인 정류소는 이미 폐쇄된 정류소이거나 새로이 생긴 정류소 일 수 있으므로 쿼리 결과에 포함되지 않도록 해주세요. 쿼리 결과에는 아래 컬럼이 포함되어 있어야 합니다.

station_id: 정류소 ID
name: 정류소 이름
local: 정류소 소속 지자체
usage_pct: 2018년 10월 대비 2019년 10월 정류소 대여/반납 건수 비율 (0이상 100이하의 값)
2018년 10월 대비 2019년 10월 정류소 대여/반납 건수 비율 값은 소수점 아래 셋째 자리에서 반올림해 둘째 자리까지 출력되어야 합니다.
================================================

WITH
  calc_usage AS (
    SELECT
      station_id,
      sum(CASE WHEN substr(rental_time, 1, 4) = '2018' THEN 1 ELSE NULL END) usage_2018,
      sum(CASE WHEN substr(rental_time, 1, 4) = '2019' THEN 1 ELSE NULL END) usage_2019
    FROM (
      SELECT
        rent_at rental_time,
        rent_station_id station_id
      FROM rental_history
      WHERE
        substr(rent_at, 1, 7) in ('2018-10', '2019-10')
      UNION ALL
      SELECT
        return_at rental_time,
        return_station_id station_id
      FROM rental_history
      WHERE
        substr(rent_at, 1, 7) in ('2018-10', '2019-10')
    )
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
