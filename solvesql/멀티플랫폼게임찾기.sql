Video Game Sales with Ratings 데이터베이스에는 1980년부터 2016년까지 발매된 게임의 정보가 들어있습니다. 개별 게임의 정보는 games 테이블에 있고, 게임 플랫폼 정보는 platforms 테이블에 저장되어 있습니다. 하나의 게임이 여러 플랫폼에 출시된 경우, games 테이블에는 이름은 같고 플랫폼 정보는 다른 레코드가 여러개 있는 형태로 저장되어 있습니다.

다양한 게임 플랫폼이 존재하지만, 제작사가 같은 플랫폼 들은 같은 계열의 플랫폼으로 분류됩니다. 그 중 아래 세 플랫폼 계열은 점유율이 높은 메이저 플랫폼 계열입니다. 플랫폼 계열이 다르면 게임 개발을 새로해야하는 경우가 많기 때문에, 많은 게임 개발사들은 여러 플랫폼 계열에 게임을 출시하는 것을 어려워 합니다.

Sony: 'PS3', 'PS4', 'PSP', 'PSV'
Nintendo: 'Wii', 'WiiU', 'DS', '3DS'
Microsoft: 'X360', 'XONE'
데이터베이스를 조회해 2012년 이후 출시된 게임들 중 둘 이상의 메이저 플랫폼 계열에 출시된 게임 이름을 출력하는 쿼리를 작성해주세요. 쿼리 결과에는 아래 컬럼만 포함되어 있어야 하고, 중복된 게임은 1번만 출력되어야 합니다.

name: 게임 이름

==================================================
HAVING COUNT(major) >= 2
같은 계열 내 복수 플랫폼 중복을 제거하지 않음
COUNT(major) 는 단순히 해당 게임이 메이저 플랫폼 계열에 몇 번 등록됐는지 카운트할 뿐, 서로 다른 계열 개수(distinct 계열 수)를 세지는 않습니다.
예를 들어 PS3, PS4 두 플랫폼에만 출시된 소니 게임은 COUNT(major)=2이지만, 분류 계열은 모두 ‘SONY’ 하나뿐이므로 잘못 결과에 포함됩니다.


with M AS
( select
    g.name,
    case 
    when p.name IN ('PS3', 'PS4', 'PSP', 'PSV') then 'SONY'
    when p.name IN ('Wii', 'WiiU', 'DS', '3DS') then 'Nintendo'
    when p.name IN ('X360', 'XONE') then 'Microsoft'
    END AS major
  from games g 
  join platforms p on g.platform_id = p.platform_id
  where g.year >= 2012 and major is not null
)

SELECT
  name
FROM M
GROUP BY name
HAVING COUNT(DISTINCT major) >= 2


