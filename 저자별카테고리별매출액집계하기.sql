-- 도서 정보(BOOK)
-- 저자 정보(AUTHOR)
-- 판매량 정보(BOOK_SALES)

SELECT 
    AUTHOR.AUTHOR_ID,
    AUTHOR.AUTHOR_NAME,
    BOOK.CATEGORY,
    SUM(BOOK_SALES.SALES*BOOK.PRICE) as TOTAL_SALES
FROM BOOK_SALES
JOIN BOOK ON BOOK_SALES.book_id=BOOK.book_id
JOIN AUTHOR ON BOOK.author_id= AUTHOR.author_id
WHERE YEAR(sales_date)=2022 and MONTH(sales_date)=1
GROUP BY AUTHOR.AUTHOR_ID,BOOK.CATEGORY 
ORDER BY AUTHOR.author_id asc, category desc
