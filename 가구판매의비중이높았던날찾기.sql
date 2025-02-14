-- 가구 판매 비중이 높았던 날
-- 일별 주문수 10 이상 + ‘Furniture’ 카테고리 주문의 비율이 40% 이상 이었던 날
-- furniture_pc(3) 높은 순, 날짜순(1)
SELECT
  order_date,
  count(DISTINCT CASE WHEN category = 'Furniture' THEN order_id ELSE NULL END) as furniture,
  round(count(DISTINCT CASE WHEN category = 'Furniture' THEN order_id ELSE NULL END ) * 100.0 / count(distinct order_id), 2 ) as furniture_pct
from
  records
group by
  order_date
HAVING
  COUNT(distinct order_id) >= 10
  AND furniture_pct >= 40
ORDER BY 3 DESC, 1; 
