-- edges 친구 관계 : user_a_id와 user_b_id는 친구 관계
-- 각 사용자의 친구 수, 친구 수가 많은 사용자부터 출력, ID가 작은 사용자 먼저
WITH A AS (
  SELECT C.user_id AS `a_id`
  , COUNT(E.user_b_id) AS `a_friends`
  FROM users C
  LEFT JOIN edges E
  ON C.user_id = E.user_a_id
  GROUP BY `a_id`
),
B AS (
  SELECT D.user_id AS `b_id`
  , COUNT(F.user_a_id) AS `b_friends`
  FROM users D
  LEFT JOIN edges F
  ON D.user_id = F.user_b_id
  GROUP BY `b_id`
)
SELECT A.`a_id` AS `user_id`
, (A.`a_friends` + B.`b_friends`) AS `num_friends`
FROM A
JOIN B ON A.`a_id` = B.`b_id`
GROUP BY `user_id`
ORDER BY `num_friends` DESC, `user_id` ASC
