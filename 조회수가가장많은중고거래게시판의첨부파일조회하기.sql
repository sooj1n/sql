-- 중고거래 게시판 정보를 담은 USED_GOODS_BOARD
-- 게시판 첨부파일 정보를 담은 USED_GOODS_FILE
-- 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회하는 SQL문을 작성해주세요. 
-- 기본적인 파일경로는 /home/grep/src/
-- 게시글 ID를 기준으로 디렉토리가 구분되고
-- 파일이름은 파일 ID, 파일 이름, 파일 확장자로 구성되도록 출력해주세요. 

# 문자열 합치기
# 1) CONCAT
# 2) '+' : 숫자는 문자형으로 변환 후 합쳐야 오류가 발생하지 않는다.

with top as
    (SELECT *
    FROM USED_GOODS_BOARD
    order by VIEWS desc
    limit 1)
    
select 
    CONCAT('/home/grep/src/',f.BOARD_ID,'/',FILE_ID,FILE_NAME,FILE_EXT) as FILE_PATH
from USED_GOODS_FILE f
join top on f.BOARD_ID=top.BOARD_ID
order by f.FILE_ID desc
