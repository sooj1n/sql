--  리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- 조인을 했을 때 겹치는 것 말고도 모두 출력되야하는 테이블이 있는지를 확인해야함. => MEMBER_PROFILE

select m.MEMBER_NAME,REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE,'%Y-%m-%d') as REVIEW_DATE
from REST_REVIEW r
join MEMBER_PROFILE m on r.MEMBER_ID=m.MEMBER_ID
where r.MEMBER_ID= (
    SELECT m.MEMBER_ID
    FROM MEMBER_PROFILE m
    left join REST_REVIEW r on m.MEMBER_ID=r.MEMBER_ID
    group by m.MEMBER_ID
    order by count(r.REVIEW_ID) Desc
    limit 1
    )
order by 3 asc, 2 asc
