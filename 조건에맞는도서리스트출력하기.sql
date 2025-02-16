-- 2021년에 출판된/  '인문' 카테고리
-- 출판일을 기준으로 오름차순 정렬

SELECT 
    BOOK_ID,
    DATE_FORMAT(PUBLISHED_DATE,'%Y-%m-%d') as PUBLISHED_DATE
FROM BOOK
WHERE YEAR(PUBLISHED_DATE)=2021 and CATEGORY='인문'
ORDER BY PUBLISHED_DATE

