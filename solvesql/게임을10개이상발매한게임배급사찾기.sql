Video Game Sales with Ratings 데이터베이스에는 2016년까지 발매된 게임의 주요 정보와 판매량, 평점 정보를 담고 있습니다. 처음 개발한 게임의 출시를 앞두고 있는 당신은 경험 많은 게임 배급사와 협업하기 위해 게임 배급사로 참여한 게임이 10개 이상인 회사에게 협업 제안을 보내려고 합니다.

데이터베이스를 조회해 게임 배급사로 참여한 게임이 10개 이상인 회사의 이름을 출력하는 쿼리를 작성해주세요. 쿼리 결과는 아래 컬럼을 포함하고 있어야 합니다.

name: 게임 배급사 이름

========================================================
select c.name
from games g 
join companies c on g.publisher_id=c.company_id
group by publisher_id
having count(game_id)>=10
