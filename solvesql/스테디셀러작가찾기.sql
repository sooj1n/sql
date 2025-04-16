Amazon Top 50 Bestselling Books 데이터베이스에는 아마존 쇼핑몰에서 2009년부터 2019년까지 매년 집계한 판매량 상위 50위의 책 정보를 담고 있습니다. 서로 다른 작품이더라도 5년 이상 연속으로 베스트셀러 목록에 올라간 작가를 모아 스테디셀러 소설 작가 특별전을 열고자 합니다.

books 테이블의 데이터를 사용해 5년 이상 연속으로 베스트셀러 작품 목록에 이름을 올린 소설 작가와 연도 정보를 출력하는 쿼리를 작성해주세요. 쿼리 결과는 아래 결과를 포함해야 합니다.


===================================
-- 1. 동일 연도에 베스트셀러에 여러권 올린 작가가 있을 수 있으니 중복 제거, 소설 작가만 추출
WITH filtering AS (
    SELECT DISTINCT author,year
    FROM books
    WHERE genre = 'Fiction'
  ), 
-- 작가별 연도순 
-- Lag: 이전행 출력
  calc_prev_year AS (
    SELECT
      author,
      year,
      lag(year, 1) OVER (PARTITION BY author ORDER BY year) prev_year
    FROM filtering
  ), 
-- CASE문을 통해 year - prev_year가 1인 경우 0을 반환하고,
-- 가장 첫번째 연도여서 prev_year가 NULL인 경우와
-- 연속 연도가 아니어서 year - prev_year가 1 이상인 경우는 모두 1을 반환하여
-- 새로운 그룹의 시작점을 1로 표시했다.
  calc_group_num AS (
    SELECT
      author,
      year,
      sum(
        CASE
        WHEN year - prev_year = 1 THEN 0 ELSE 1
        END
      ) OVER (PARTITION BY author ORDER BY year) group_num
    FROM calc_prev_year
  )

SELECT
  author,
  max(year) year,
  count(*) depth
FROM calc_group_num
GROUP BY author, group_num
HAVING count(*) >= 5
