Video Game Sales with Ratings 데이터베이스에는 2016년까지 발매된 게임의 주요 정보와 판매량, 평점 정보가 담겨 있습니다. games 테이블에 들어있는 평점 정보는 평론가 평점(critic_score), 평점을 남긴 평론가 수(critic_count), 사용자 평점(user_score), 평점을 남긴 사용자 수(user_count)로 구성되어 있습니다.

평점 정보에 일부 누락이 있음을 알게된 당신은 같은 장르를 가진 게임들의 평균 평점과 평균 평론가/사용자 수를 활용해 누락된 값을 채우려고 합니다. 2015년 이후에 발매한 게임 중 누락된 평점 정보가 있는 게임에 대해서 같은 장르를 가진 전체 게임의 평균 평점과 평균 평론가/사용자 수를 사용해 누락된 정보를 채우는 쿼리를 작성해주세요. 쿼리 결과에는 누락된 평점 정보가 있는 게임만 포함되어야 하며, 아래 6개 컬럼이 있어야 합니다. 또한, 평론가와 사용자 평점 평균은 소수점 아래 넷째 자리에서 반올림 해 셋째 자리까지 출력되어야 하고, 사용자 수는 올림하여 자연수로 출력되어야 합니다.

=======================================================
with score AS (
    select
      genre_id,
      round(avg(critic_score), 3) as critic_score,
      ceil(avg(critic_count)) as critic_count,
      round(avg(user_score), 3) as user_score,
      ceil(avg(user_count)) as user_count
    from games
    group by genre_id
)

select
  g.game_id,
  g.name,
  ifnull(g.critic_score,s.critic_score) as critic_score,
  ifnull(g.critic_count,s.critic_count) as critic_count,
  ifnull(g.user_score,s.user_score) as user_score,
  ifnull(g.user_count,s.user_count) as user_count
from games g
join score s on g.genre_id=s.genre_id
WHERE g.year>=2015 and ((g.critic_score IS NULL) OR (g.critic_count IS NULL) OR (g.user_score IS NULL) OR (g.user_count IS NULL))


