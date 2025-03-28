Palmer Penguins 데이터베이스는 펭귄의 종, 서식지, 부리 길이 등 펭귄들의 특성 정보를 담고 있습니다. 서식지 별로 어떤 펭귄이 사는지 조사하기 위해 펭귄의 종과 서식지를 출력하는 쿼리를 작성해주세요. 단, 각 서식지에 대해서 펭귄의 종은 중복 없이 1번씩만 나와야 합니다.

쿼리 결과는 아래 컬럼을 포함해야하고, 서식지 순으로 오름차순 정렬되어 있어야 합니다. 서식지가 같은 서로 다른 펭귄 종 사이에서는 펭귄 종 이름 순으로 오름차순 정렬되어 있어야 합니다.


select distinct
  species,
  island
from
  penguins
order by
  island


==============
SELECT 
  DISTINCT species,
  island
FROM
  penguins
ORDER BY
  island

여기서 DISTINCT는 species 열에만 적용될까요? 아니면 species, island 조합에 적용될까요?

✅ 정답: species, island 조합 전체에 대해 DISTINCT가 적용됩니다.
