전국 카페 장소 데이터 데이터베이스는 2024년 6월 기준 서울에서 제주까지 전국 각지에 있는 카페의 기본 정보를 담고 있습니다.

이 중 address 컬럼에는 주소 정보가 들어가있는데, 정제가 되어있지 않아 활용이 어렵습니다. 이 데이터를 각각 시, 도 정보를 담고 있는 sido 컬럼과 시, 군, 구 정보를 담고 있는 sigungu로 정제하여 각 행정구역 별로 몇 개의 카페가 있는지 집계하는 쿼리를 작성해주세요. 쿼리 결과는 카페가 가장 많은 행정구역 순으로 출력을 해야 합니다.

예를 들어, ‘경기도 성남시 분당구 구미로 11’이라는 데이터는 sido 값이 ‘경기도’, sigungu 값이 ‘성남시’로 정제되어야 합니다. ‘대전광역시 대덕구 계족로 545’라는 데이터는 sido 값이 ‘대전광역시’, sigungu 값이 ‘대덕구’로 정제되어야 합니다.

sido: 시, 도 정보 (예시. ‘대전광역시’, ‘강원특별자치도’, ‘충청남도’)
sigungu: 시, 군, 구 정보 (예시. ‘성남시’, ‘성동구’)
cnt: 해당 행정구역에 포함된 카페 수

===============================================================
# instr(X, Y): 문자열 X 안에서 Y가 처음 등장하는 1‑기반 위치를 반환(없으면 0).
# substr(X, start [, length]): X의 start 위치(1부터 시작)에서 length만큼(생략 시 끝까지) 잘라낸 문자열을 반환.

SELECT
  substr(address,0,instr(address, ' ')) as sido,
  substr(substr(address,instr(address, ' ')+1),0,instr(substr(address,instr(address, ' ')+1),' ')) as sigungu,
  count(cafe_id) as cnt
from
  cafes
GROUP BY sido, sigungu
order by cnt desc
