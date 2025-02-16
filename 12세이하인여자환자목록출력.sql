-- 12세 이하인 여자환자
-- 전화번호가 없는 경우, 'NONE'으로 출력
-- 나이를 기준으로 내림차순 정렬하고, 나이 같다면 환자이름을 기준으로 오름차순 정렬
-- ** IFNULL(column_name, default_value)
-- ** CASE 
--      WHEN condition1 THEN result1
--      WHEN condition2 THEN result2
--      ELSE default_result
--      END 

SELECT 
    PT_NAME,
    PT_NO,
    GEND_CD,
    AGE,
    IFNULL(TLNO,'NONE') as TLNO
    -- CASE WHEN TLNO IFNULL THEN 'NONE' ELSE TLNO END
FROM PATIENT
WHERE GEND_CD='W' and AGE<=12 
ORDER BY 4 desc, 1 asc
