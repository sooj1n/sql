-- 노선별(ROUTE)로 노선, 총 누계 거리, 평균 역 사이 거리를 노선별로 조회
-- 총 누계거리(TOTAL_DISTANCE)는 테이블 내 존재하는 역들의 역 사이 거리(AVERAGE_DISTANCE)의 총 합
-- 총 누계거리는 소수 둘째자리에서, 평균 역 사이 거리는 소수 셋째 자리에서 반올림 한 뒤 단위(km)를 함께 출력
-- 총 누계 거리를 기준으로 내림차순 정렬

==================================================================
정렬기준이 총 누계거리인데, order by가 제대로 먹힐려면, 숫자 기준으로 큰 순서대로(desc니까) 되어야겠죠? 그런데, concat()함수를 써서 'km'를 붙여주었고, 이러면 문자열로 인식이 되어버려요. 그래서 테스트1 케이스는 되게 간단한거지만, 예를 들어, 10km가 있고 2km가 있다고 하면, 2km 10km 이렇게 될거에요. 아스키값으로 변환했을 때, 2가 1보다 앞에 있으니까요.

select 
    ROUTE, 
    CONCAT(round(sum(D_BETWEEN_DIST),1),'km') as TOTAL_DISTANCE, 
    CONCAT(round(avg(D_BETWEEN_DIST),2),'km') as AVERAGE_DISTANCE
from SUBWAY_DISTANCE
group by ROUTE
order by round(sum(d_between_dist), 1) desc


