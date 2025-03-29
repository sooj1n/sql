DVD Rental Store 데이터베이스는 DVD 대여점의 관리 프로그램이 사용하는 데이터베이스입니다. 그 중 film 테이블은 DVD 대여점에서 취급하는 영화 정보를 담고 있습니다.

rating 컬럼에는 미국영화협회(Motion Picture Association, MPA)에서 운영하는 영화 등급 제도 데이터가 들어있습니다. 이는 영화의 내용을 연령대별로 분류하여 관람 적합성을 판단하는 시스템인데 각 등급은 아래 의미를 가집니다.

G (General Audience): 모든 연령 관람 가능
PG (Parental Guidance Suggested): 아동 관람 시 부모 지도 필요
PG-13 (Parents Strongly Cautioned): 13세 미만 관람 시 부모의 주의 필요
R (Restricted): 17세 미만은 부모 또는 21세 이상과 동반 관람만 가능
NC-17 (No One 17 and Under Admitted): 18세 미만 관람 불가
17세 미만 학생이 DVD 대여점에 혼자와서는 대여할 수 없는 영화 중 제목이 모음(’A’, ‘E’, ‘I’, ‘O’, ‘U’)로 끝나지 않는 영화를 찾고 싶습니다. 조건에 맞는 영화 제목(title)을 출력하는 쿼리를 작성해주세요. 다른 컬럼은 출력되지 말아야 합니다.

------------------------------------------------------------------
select title
from film
where rating IN ('R', 'NC-17') and not title REGEXP '(A|E|I|O|U)$'


-- where rating='R' or rating='NC-17'
-- WHERE rating IN ('R', 'NC-17');
-- WHERE rating REGEXP '^(R|NC-17)$';

# ^ 문자열의 시작
# $ 문자열의 끝
# . 임의의 한 문자


