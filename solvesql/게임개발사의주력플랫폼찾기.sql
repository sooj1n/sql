Video Game Sales with Ratings 데이터베이스는 1980년부터 2016년까지 출시된 게임들의 다양한 정보가 포함되어 있습니다. 포함된 정보에는 게임 개발사 정보와 각 게임의 플랫폼, 게임의 판매량 정보도 있습니다. 게임 분야에는 많은 플랫폼이 있기 때문에 하나의 개발사가 모든 플랫폼에 게임을 출시하는 것은 생각보다 어려운 일 입니다. 각 게임 개발사는 주력 플랫폼을 정해두고 해당 플랫폼 위주로 게임을 출시합니다. 따라서, 개발사마다 주력 플랫폼은 보통 판매량이 가장 많은 플랫폼으로 생각할 수 있습니다.

games 테이블, companies 테이블, platforms 테이블을 조회해 각 게임 개발사의 주력 플랫폼과 해당 플랫폼의 판매량 합계를 집계하는 쿼리를 작성해주세요. 쿼리 결과에는 아래 컬럼이 포함되어야 합니다. 만약, 판매량 합계가 동일한 플랫폼이 여러 개라면 모두 출력해주세요.

developer: 게임 개발사 이름
platform: 주력 플랫폼 이름
sales: 게임 개발사의 주력 플랫폼 판매량 합계

=================================
함수 	        설명	                                        예시
RANK()	        동일 값에 같은 순위를 부여하며 순위 건너뜀	각 developer별 판매량 순위 계산
DENSE_RANK()	동일 값에 같은 순위를 부여하지만 건너뛰지 않음	각 region별 판매량 순위 계산
ROW_NUMBER()	그룹 내에서 고유한 순번 부여	각 platform별 출시된 게임 순번 부여
NTILE(n)	그룹을 n개의 균등한 크기로 나누어 순위를 부여	각 developer를 4개의 판매량 구간으로 나눔
===================================
WITH
  mainplatforms AS (
    SELECT
      developer_id,
      platform_id,
      SUM(sales_na + sales_eu + sales_jp + sales_other) AS sales,
      RANK() OVER (
        PARTITION BY
          developer_id
        ORDER BY
          SUM(sales_na + sales_eu + sales_jp + sales_other) DESC
      ) AS sales_rank
    FROM
      games
    GROUP BY
      developer_id,
      platform_id
  )
SELECT
  c.name AS developer,
  p.name AS platform,
  g.sales
FROM
  mainplatforms g
  INNER JOIN platforms p ON g.platform_id = p.platform_id
  INNER JOIN companies c ON g.developer_id = c.company_id
WHERE
  1 = 1
  AND g.sales_rank = 1
