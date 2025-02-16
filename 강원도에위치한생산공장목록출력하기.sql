-- 강원도에 위치
-- 공장 ID를 기준으로 오름차순
-- LIKE : 패턴과 일치하는 데이터를 검색
-- % : 0개 이상의 문자와 일치
-- _ : 1개의 문자와 일치
--------------------------
LIKE 'J%'	J로 시작하는 값	John, Johnny, Jone, Jason
LIKE '%n'	n으로 끝나는 값	John, Jone, Jason
LIKE '%John%'	"John" 포함	John, Johnny
LIKE 'J_n%'	3번째 글자가 'n'인 값	John, Jone
LIKE 'J___'	J로 시작하는 4글자 값	John, Jone
--------------------------

SELECT 
    FACTORY_ID,FACTORY_NAME,ADDRESS
FROM 
    FOOD_FACTORY
WHERE 
    ADDRESS LIKE '강원%'
ORDER BY 
    1 asc
    

