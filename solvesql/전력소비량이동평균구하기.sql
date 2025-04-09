# rows between 범위 지정키워드
-- unbounded preceding (맨 처음부터)
-- n preceding (n개 앞부터)
-- current row (현재행)
-- n following (n개 뒤까지)
-- unbounded following (맨끝까지)

예시
sum(sales) over (order by date rows between 2 preceding and current row)
: 2행 전부터 ~ 현재 행까지의 합계를 구하기

avg(sales) over (order by date rows between current row and unbounded following)
: 현재행부터 맨마지막 행 사이의 평균 구하기
-------------------------
# interval datetime
현재시간에 1년 더하기 select date_add(now(), interval 1 year)

현재시간에 1시간 빼기 select date_add(now(), interval -1 hour)

SQlite은 date_add 함수가 지원되지 않음 select datetime(now(), '-1 hour')
---------------------------
✔1. 모든 datetime 이 기존 measured_at 의 10분 뒤
-> 10분 뒤의 값을 end_at로 출력
✔2. 1시간 데이터를 구하기
-> window 함수 preceding 을 활용
-> 5개 이전의 행부터 현재행까지의 평균을 구함
✔3. measured_at기준 1월 31일 데이터 출력
-> strftime을 이용해 where 구문을 길게 작성
-> 2017년 1월 데이터로 한정해서 간단하게 구문 작성 가능
===================================================
Power Consumption of Tetouan City 데이터베이스는 모로코 북부 도시 중 하나인 테투안 지역의 전력 소비량과 기상 관측치가 들어있는 데이터베이스 입니다. 테투안 지역에는 Quads, Smir, Boussafou 총 3개 지역에 발전소가 있으며 해당 발전소로 부터의 전력 소비량이 각각 측정되어 있습니다. 전력 소비량 측정은 매 10분마다 시작해 10분간 진행하는 방식이고, measured_at 컬럼에 측정 시작 시각이 기록되어 있습니다. 전력 소비량은 순간순간 크게 변화하는 값이기에 트렌드를 보거나 수요 예측을 하기 위해서 단순 이동 평균을 자주 사용 합니다.

2017년 1월 1일 0시부터 2017년 2월 1일 0시까지 10분 단위로 3개 발전소 전력 소비량의 1시간 범위 단순 이동 평균을 계산하는 쿼리를 작성해주세요. 평균을 내기 위한 데이터의 범위가 1시간보다 작은 경우 해당 범위에 포함되는 측정 값만 평균 계산에 포함시켜주세요. 쿼리 결과에는 아래 컬럼이 포함되어 있어야 하고, 이동 평균 값은 소수점 셋째 자리에서 반올림 해 둘째 자리까지 표시되어야 합니다.

end_at: 이동 평균 범위의 끝 시각
zone_quads: Quads 지역 전력 소비량의 1시간 단순 이동 평균
zone_smir: Smir 지역 전력 소비량의 1시간 단순 이동 평균
zone_boussafou: Boussafou 지역 전력 소비량의 1시간 단순 이동 평균
===================================================


select datetime(measured_at,'+10 minutes') as end_at, 
round(avg(zone_quads ) over (order by measured_at rows between 5 preceding and current row),2)  as zone_quads,
round(avg(zone_smir ) over (order by measured_at rows between 5 preceding and current row),2)  as zone_smir,
round(avg(zone_boussafou ) over (order by measured_at rows between 5 preceding and current row),2)  as zone_boussafou

from power_consumptions
where strftime('%Y-%m-%d %H:%M:%S',measured_at) >= '2017-01-01 00:00:00' and strftime('%Y-%m-%d %H:%M:%S',measured_at) <= '2017-01-31 23:50:00'

