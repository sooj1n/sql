-- 중고 거래 게시판 정보를 담은 USED_GOODS_BOARD
-- 게시판 첨부파일 정보를 담은 USED_GOODS_USER
-- 중고 거래 게시물을 3건 이상 등록한 사용자
-- 전체 주소는 시, 도로명 주소, 상세 주소
-- 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력

### 문자열 합치기 : CONCAT()
### 문자열 자르기 : SUBSTR(시작위치,시작위치부터 문자 개수)

SELECT 
    USER_ID,
    NICKNAME,
    CONCAT(CITY,' ',STREET_ADDRESS1,' ',STREET_ADDRESS2) as '전체주소',
    CONCAT(SUBSTR(TLNO,1,3),'-',SUBSTR(TLNO,4,4),'-',SUBSTR(TLNO,8,4)) as '전화번호'
from USED_GOODS_BOARD b
join USED_GOODS_USER u on b.WRITER_ID=u.USER_ID
group by WRITER_ID
having count(BOARD_ID)>=3
order by USER_ID desc
