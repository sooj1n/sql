-- 따라서 user_b_id가 3820인 레코드를 추출하면 3820보다 작은 id를 가지는 친구들의 id를 추출할 수 있고,
-- 반대로 user_a_id가 3820인 레코드를 추출하면 3820보다 큰 id를 가지는 친구들의 id를 추출할 수 있다.

-- Union all
-- 출력하는 user_a_id와 user_b_id가 모두 3820보다 작은 경우
-- user_a_id는 3820보다 작고 user_b_id는 3820보다 큰 경우,
-- 모두 3820보다 큰 경우
WITH
  friends_of_3820_1 AS (
    SELECT
      user_a_id friend_id
    FROM edges
    WHERE user_b_id = 3820
  ),
  friends_of_3820_2 AS (
    SELECT
      user_b_id friend_id
    FROM edges
    WHERE user_a_id = 3820
  )

SELECT
  user_a_id,
  user_b_id,
  3820 user_c_id
FROM edges
WHERE
  user_a_id IN (SELECT * FROM friends_of_3820_1)
  AND user_b_id IN (SELECT * FROM friends_of_3820_1)

UNION ALL

SELECT
  user_a_id,
  3820 user_b_id,
  user_b_id user_c_id
FROM edges
WHERE
  user_a_id IN (SELECT * FROM friends_of_3820_1)
  AND user_b_id IN (SELECT * FROM friends_of_3820_2)

UNION ALL

SELECT
  3820 user_a_id,
  user_a_id user_b_id,
  user_b_id user_c_id
FROM edges
WHERE
  user_a_id IN (SELECT * FROM friends_of_3820_2)
  AND user_b_id IN (SELECT * FROM friends_of_3820_2);
