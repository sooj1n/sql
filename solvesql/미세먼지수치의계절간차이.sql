서울숲 일별 평균 대기오염도 데이터베이스에는 서울숲 대기 관측소에서 2022년 1년 동안 측정한 대기 오염 정보가 들어있습니다.

이 데이터를 활용해 봄, 여름, 가을, 겨울 계절 별로 미세먼지(PM10)의 농도에 차이가 있는지 알아보고 싶습니다. 3월 1일부터 5월 31일까지를 ‘spring’, 6월 1일부터 8월 31일까지를 ‘summer’, 9월 1일부터 11월 30일까지를 ‘autumn’, 나머지를 ‘winter’라고 이름 붙이고 각 계절별로 미세먼지 농도의 중앙값과 평균을 계산하는 쿼리를 작성해주세요. 쿼리 결과는 아래 세 컬럼을 포함해야 하고, PM10 농도의 평균값은 소수점 셋째 자리에서 반올림 해 소수점 둘째 자리까지 표시되어야 합니다.

season: 계절 (’spring’, ‘summer’, ‘autumn’, ‘winter’)
pm10_median: PM10 농도의 중앙값
pm10_average: PM10 농도의 평균

=======================================
SQLite에서 월 추출
strftime('%m', date_col)    AS month_str,   -- '01'~'12' (문자열)
CAST(strftime('%m', date_col) AS INTEGER) AS month_int  -- 1~12 (숫자)
=========================================
with season as(
  select 
    pm10,
    case 
    when strftime('%m', measured_at) IN ('03','04','05') THEN 'spring'
    when strftime('%m', measured_at) IN ('06','07','08') THEN 'summer'
    when strftime('%m', measured_at) IN ('09','10','11') THEN 'autumn'
    when strftime('%m', measured_at) IN ('01','02','12') THEN 'winter'
    END AS ss
  from measurements
)

select 
  ss as season,
  median(pm10) as pm10_median,
  round(avg(pm10),2)as pm10_average
from season
group by ss 
