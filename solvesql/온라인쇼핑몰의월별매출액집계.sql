UK E-Commerce Orders 데이터베이스는 영국의 한 온라인 쇼핑몰의 운영 데이터베이스 입니다. 그 중 orders 테이블은 온라인 쇼핑몰의 주문 정보를 담고 있고, order_items 테이블에는 주문한 상품, 상품의 개당 가격, 주문한 수량 등 주문의 상세 정보가 저장되어 있습니다.

이 온라인 쇼핑몰의 월 별 매출 규모를 한 눈에 파악할 수 있는 데이터를 만들고 싶습니다. 위 두 테이블의 데이터를 조합해 월 별로 취소 주문을 제외한 주문 금액의 합계, 취소 주문의 금액 합계, 그리고 총 합계를 계산하는 쿼리를 작성해주세요. order_id가 C로 시작하는 주문이 취소 주문입니다. 결과 데이터는 아래 4개 컬럼을 포함해야 하고 order_month 컬럼의 값으로 오름차순 정렬되어 있어야 합니다.

order_month: YYYY-MM 형식으로 표기된 주문 연, 월 정보
ordered_amount: 취소 주문을 제외한 주문 금액의 합계
canceled_amount: 취소 주문의 금액 합계 (음수로 표시)
total_amount: 취소 주문을 포함한 주문 금액의 총 합계

==================================================
select
  SUBSTRING(order_date,1,7) as order_month,
  sum(CASE WHEN order_items.order_id LIKE 'C%' THEN 0 ELSE quantity * price END) as ordered_amount,
  sum(CASE WHEN order_items.order_id LIKE 'C%' THEN quantity * price ELSE 0 END) as canceled_amount,
  sum(quantity*price) as total_amount
from
  orders
  JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY
  order_month
ORDER BY
  order_month ASC;
