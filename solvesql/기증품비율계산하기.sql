Museum of Modern Art Collection 데이터베이스는 미국 뉴욕의 근현대 미술관인 MoMA의 작품 정보를 담고 있습니다. artworks 테이블에서는 MoMA가 소장한 작품의 정보가 있습니다. 작품 정보 중 credit 컬럼에 'gift'라는 단어가 등장하는 작품은 MoMA가 다른 사람이나 단체로 부터 기증 받은 기증품이라는 뜻입니다.

이 테이블의 데이터를 활용해 소장품 중 부분 기증품을 포함한 기증품의 비율이 얼마나 되는지 계산하는 쿼리를 작성해주세요. 기증품의 비율은 백분율로 계산되어야하고, 소수점 아래 넷째 자리에서 반올림 해 셋째 자리까지 표시 되어야 합니다. 예를 들어, 전체 소장품 중 1/3의 작품이 기증품이라면 제출된 답안은 33.333 이어야 합니다.

### 백분율 구하는 방법
SQL에서 정수 나누기는 소수점을 버리고 결과가 정수로 나옵니다.
그래서 그냥 나눗셈하면 0으로 나올 수 밖에 없음.

공식 : (부분 값 / 전체 값) * 100 
Sql : (부분값 *1.0)/ 전체값 *100 또는 (부분값)*100.0 / 전체값
(SUM(CASE WHEN credit LIKE '%gift%' THEN 1 ELSE 0 END) * 100.0 / COUNT(artwork_id))
(SUM(CASE WHEN credit LIKE '%gift%' THEN 1 ELSE 0 END) *1.0 / COUNT(artwork_id)) * 100

---------------------------------------------------------------------------------------

select
  round((SUM(CASE WHEN credit LIKE '%gift%' THEN 1 ELSE 0 END) * 100.0 / COUNT(artwork_id)),3) AS ratio
from
  artworks
