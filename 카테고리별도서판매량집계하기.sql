-- 도서의 정보 (BOOK)
-- 판매량 정보 (BOOK_SALES)

-- 2022년 1월의 카테고리 별 도서 판매량을 합산
-- 카테고리명을 기준으로 오름차순 정렬

-- WHERE 절은 GROUPBY 보다 앞에 있어야함
-- 카테고리별 도서 판매량(TOTAL_SALES) 을 구해야 하므로 b.price가 아니라 bs.sales의 합계

SELECT b.CATEGORY, SUM(bs.sales) as TOTAL_SALES
FROM BOOK_SALES bs
JOIN BOOK b ON bs.book_id=b.book_id
WHERE YEAR(SALES_DATE)=2022 and MONTH(SALES_DATE)=1
GROUP BY b.category
ORDER BY CATEGORY 

