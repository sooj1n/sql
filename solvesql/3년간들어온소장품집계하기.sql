Museum of Modern Art Collection 데이터베이스에는 뉴욕 현대 미술관에 소장된 소장품과 그 작가 정보가 들어있습니다. 소장품 정보를 담고 있는 artworks 테이블은 소장품의 소장 일시(acquisition_date)와 소장품의 분류(classification) 정보가 들어있습니다. 이 정보를 바탕으로 2014년부터 2016년까지 3년간 어떤 분류의 소장품이 많이 추가되었는지 알고자 합니다.

아래와 예시와 같은 형태로 각 분류에 대해 연도별 추가된 소장품 수를 집계하는 쿼리를 작성해주세요. 쿼리 결과는 아래 컬럼을 포함해야하고, 컬럼 순서 역시 아래 예시 순서와 동일해야하며, 각 행은 분류(classification) 컬럼 기준으로 오름차순 정렬되어 있어야 합니다. 또한, 집계하는 3년간 추가된 소장품이 없더라도 이전 년도에 소장품이 있는 분류라면 해당 분류를 결과 테이블에 포함해주세요.

===================================================
# strftime('%Y','날짜') 년도추출
===================================================

SELECT
  classification,
  SUM(CASE WHEN strftime('%Y', acquisition_date) = '2014' THEN 1 ELSE 0 END) AS "2014",
  SUM(CASE WHEN strftime('%Y', acquisition_date) = '2015' THEN 1 ELSE 0 END) AS "2015",
  SUM(CASE WHEN strftime('%Y', acquisition_date) = '2016' THEN 1 ELSE 0 END) AS "2016"
FROM
  artworks
GROUP BY
  classification
ORDER BY
  classification;

