-- '경제' 카테고리에 속하는 도서
-- 출판일을 기준으로 오름차순 정렬

###
날짜 포맷 DATE_FORMAT(PUBLISHED_DATE,'%Y-%m-%d')
###

SELECT 
    BOOK_ID, 
    AUTHOR_NAME, 
    DATE_FORMAT(PUBLISHED_DATE,'%Y-%m-%d') as PUBLISHED_DATE
FROM BOOK b
join AUTHOR a on b.author_id=a.author_id
where category='경제'
Order by PUBLISHED_DATE

