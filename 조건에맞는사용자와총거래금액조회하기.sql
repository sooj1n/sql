-- 중고 거래 게시판 정보 USED_GOODS_BOARD
-- 사용자 정보 USED_GOODS_USER
-- 완료된 중고 거래의 총금액이 70만 원 이상인 사람
--  총거래금액을 기준으로 오름차순 정렬
=====
USER_ID와 NICKNAME은 1:1 관계이므로 GROUP BY u.USER_ID만 사용해도 충분합니다.
불필요한 컬럼을 GROUP BY에 포함하면 성능 저하가 발생할 수도 있으므로, GROUP BY u.USER_ID를 추천
======

SELECT u.USER_ID,u.NICKNAME,sum(b.PRICE) as TOTAL_SALES
FROM USED_GOODS_USER u
JOIN USED_GOODS_BOARD b ON u.USER_ID=b.WRITER_ID
WHERE STATUS='DONE'
GROUP BY u.USER_ID
HAVING sum(b.PRICE)>=700000
ORDER BY TOTAL_SALES
