-- PARENT 아이템이 없는 아이템을 ROOT 아이템
-- 'ITEM_A'->'ITEM_B'->'ITEM_C' ==> ROOT 아이템은 'ITEM_A'가 됩니다
-- ROOT 아이템의 PARENT 아이템 ID는 NULL 입니다.

select i.ITEM_ID,ITEM_NAME
from ITEM_INFO i
join ITEM_TREE t on i.ITEM_ID=t.ITEM_ID
where t.PARENT_ITEM_ID IS NULL
order by i.ITEM_ID
