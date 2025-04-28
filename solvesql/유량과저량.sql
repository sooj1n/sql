-- 연도별로 새롭게 소장하게 된 작품의 수와 (유량)
-- 연도별 누적 소장 작품 수를 계산하는 쿼리를 작성해주세요. (저량)
-- 저량 지표에 변화가 없는 연도는 출력되지 않아야 하고, 소장 년도 정보가 없는 작품은 집계에서 제외해주세요. 

=================================================================
소장 연도별 artwork_id를 중복을 제거하여 카운트하면 New acquisitions this year (Flow)가 된다.
다음, Total collection size (Stock)은 New acquisitions this year (Flow)를 sum over를 통해 Acquisition year를 기준으로 정렬하여 누적합을 계산하면 된다.
=================================================================

SELECT
  substr(acquisition_date, 1, 4) as "Acquisition year",
  count(DISTINCT artwork_id) as "New acquisitions this year (Flow)",
  sum(count(distinct artwork_id)) OVER (ORDER BY substr(acquisition_date, 1, 4)) as "Total collection size (Stock)"
FROM artworks
WHERE substr(acquisition_date, 1, 4) IS NOT NULL
GROUP BY 1
HAVING count(DISTINCT artwork_id) > 0
ORDER BY 1;
