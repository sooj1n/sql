-- 평균 대여 기간이 7일 이상인 자동차
# DATE_ADD() : 날짜, 시간 더하기
# DATE_SUB() : 날짜, 시간 빼기
# DATEDIFF() : 두 기간 사이의 일수 계산
# TIMEDIFF() : 두 기간 사이의 시간 계산
# PERIOD_DIFF() : 두 기간 사이의 개월 수 계산
# TIMESTAMPDIFF() : 두 기간 사이의 시간 계산

당일 대여 반납은 count 하지 않는것을 확인. 즉, 일수 평균에 있어서 오류가 났던것. 
- 해결 방법으로는 datediff 한 것에 + 1 을 해서 평균내기 ! 

SELECT CAR_ID, round(avg(DATEDIFF(end_date,start_date)+1),1) as AVERAGE_DURATION
From CAR_RENTAL_COMPANY_RENTAL_HISTORY
Group by car_id
having avg(DATEDIFF(end_date,start_date)+1)>=7
order by 2 desc, 1 desc

