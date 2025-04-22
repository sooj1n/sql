Facebook 소셜 네트워크 데이터베이스는 Facebook 서비스에서 샘플링한 사용자의 메타 정보와 사용자 사이의 친구 관계를 담고 있습니다. edges 테이블에는 사용자의 친구 관계 정보가 들어있는데 각 행의 user_a_id 컬럼 사용자와 user_b_id 컬럼 사용자가 서로 친구 관계라는 의미 입니다.

데이터베이스에 포함된 모든 사용자에 대해 각 사용자의 친구 수를 집계해 출력하는 쿼리를 작성해주세요. 쿼리 결과에는 아래 컬럼이 포함되어 있어야 하고, 친구 수가 많은 사용자부터 출력되어야 합니다. 만약 친구 수가 같은 사용자가 여럿이라면 그 사이에서는 사용자 ID가 작은 사용자가 먼저 출력되어야 합니다.

user_id: 사용자 ID
num_friends: 친구 수
==================================================


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
SELECT 
    A.`a_id` AS `user_id`,
    (A.`a_friends` + B.`b_friends`) AS `num_friends`
FROM A
JOIN B ON A.`a_id` = B.`b_id`
GROUP BY `user_id`
ORDER BY `num_friends` DESC, `user_id` ASC
