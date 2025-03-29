-- 서울에 위치한 식당
-- 평균점수 반올림
-- 평균점수 기준 내림차순
-- 평균점수 같다면 즐겨찾기수 기준

-- LIKE : 문자열에 포함 여부
-- IN : 리스트에 포함 여부

SELECT 
    ri.REST_ID,
    ri.REST_NAME,
    ri.FOOD_TYPE,
    ri.FAVORITES,
    ri.ADDRESS,
    round(AVG(rr.REVIEW_SCORE),2) as SCORE
FROM
    REST_INFO ri join REST_REVIEW rr on ri.REST_ID=rr.REST_ID
WHERE
    ri.ADDRESS LIKE '서울%'
group by ri.REST_ID
order by 6 desc, 4 desc
