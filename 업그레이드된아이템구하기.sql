-- 아이템의 희귀도가 'RARE'

-- 서브쿼리 => 별칭 필수

SELECT 
    ii.ITEM_ID,
    ii.ITEM_NAME,
    ii.RARITY
FROM (
SELECT It.ITEM_ID
FROM ITEM_INFO ii
JOIN ITEM_TREE it on ii.ITEM_ID=it.PARENT_ITEM_ID
WHERE RARITY='RARE') as child
JOIN ITEM_INFO ii on child.ITEM_ID=ii.ITEM_ID
ORDER BY ITEM_ID desc
