points 테이블은 프란시스 앤스컴이 만든 Anscombe's quartet 데이터를 담고 있습니다. 이 데이터는 quartet 컬럼에 의해 4개의 서브셋으로 나뉘어지고, 각 서브셋은 평균, 표본 분산, 상관계수 등이 거의 동일하나 데이터의 분포를 시각화하면 전혀 다른 분포를 가지는 특징이 있습니다.

points 테이블에서 가장 큰 x 값을 가지는 데이터와 가장 큰 y 값을 가지는 데이터의 id를 출력하는 쿼리를 작성해주세요. 결과는 오름차순으로 정렬해주세요.

=====================================================
# max() 함수는 where절에서 쓸 수 없다
=====================================================

select id 
from points 
JOIN (select max(x) as maxx, max(y) as maxy from points ) on maxx=x or maxy=y
order by id asc;
