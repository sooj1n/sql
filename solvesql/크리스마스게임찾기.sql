Video Game Sales with Ratings 데이터베이스에는 1980년부터 2016년까지 출시된 게임 정보가 들어있습니다. 크리스마스에 놀러올 조카를 위해 함께 할 수 있는 크리스마스 게임을 찾아보려고 합니다. games 테이블에서 게임 이름에 "Christmas" 또는 "Santa"가 포함된 게임을 찾는 쿼리를 작성해주세요. 쿼리 결과에는 아래 컬럼이 포함되어 있어야 합니다.

game_id: 게임 ID
name: 게임 이름
year: 발매 연도
================================
# REGEXP 뒤에 나오는 패턴은 문자열로 작성해야 하고, 그 패턴 안에 특정 키워드를 연결할 때 |를 사용합니다.
# []는 문자 클래스에 사용되며, |는 정규 표현식에서 "또는"을 의미하지만, [] 안에서는 그렇게 사용되지 않습니다.

select game_id, name, year
from games
where name REGEXP 'Christmas|Santa'
-- where name REGEXP['Christmas'|'Santa']
