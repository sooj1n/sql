-- AIR_POLLUTION 테이블은 전국의 월별 미세먼지 정보
-- 수원 지역의 연도 별 평균 미세먼지 오염도와 평균 초미세먼지 오염도를 조회
-- 평균 미세먼지 오염도와 평균 초미세먼지 오염도의 컬럼명은 각각 PM10, PM2.5로 해 주시고, 값은 소수 셋째 자리에서 반올림해주세요.
-- 연도를 기준으로 오름차순 정렬해주세요.

select 
    YEAR(YM) as YEAR,
    round(avg(PM_VAL1),2) as "PM10",
    round(avg(PM_VAL2),2) as "PM2.5"
from AIR_POLLUTION
where LOCATION2='수원'
Group by YEAR(YM)
order by YEAR(YM)
