-- Python 스킬을 가진 개발자
-- WHERE 'Python'=SKILL_1 or 'Python'=SKILL_2 or 'Python'=SKILL_3 대신 IN 연산자(?) 사용
SELECT 
    ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM DEVELOPER_INFOS
WHERE 'Python' IN (SKILL_1, SKILL_2, SKILL_3)
ORDER BY ID
