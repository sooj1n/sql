#차이가 10분 미만이라면 세션 시작이 아니므로 0,
#prev_timestamp가 NULL이어서 계산값이 NULL이거나 차이가 10분 이상이라면 새로운 세션이 시작됨을 알리기 위해 1을 반환
#sum over를 event_timestamp_kst 순서대로 누적합을 계산하여 new_session_id를 생성했다.

WITH
  calc_prev_timestamp AS (
    SELECT
      user_pseudo_id,
      event_timestamp_kst,
      lag(event_timestamp_kst, 1) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp_kst) prev_timestamp, -- 이전 타임스탬프
      event_name,
      ga_session_id
    FROM ga
    WHERE user_pseudo_id = 'a8Xu9GO6TB'
  )


SELECT
  user_pseudo_id,
  event_timestamp_kst,
  event_name,
  ga_session_id,
  sum( CASE
      WHEN julianday(event_timestamp_kst) - julianday(prev_timestamp) < 10.0/60/24 THEN 0
      ELSE 1 END
  ) OVER (ORDER BY event_timestamp_kst) new_session_id
FROM calc_prev_timestamp
ORDER BY 2;

