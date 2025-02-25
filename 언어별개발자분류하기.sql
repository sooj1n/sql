-- SKILLCODES 프로그래밍 언어
-- DEVELOPERS 개발자
-- GRADE별 개발자의 정보를 조회
-- GRADE가 존재하는 개발자의 GRADE, ID, EMAIL을 조회
-- GRADE, ID를 기준으로 오름차순 정렬
-- & 연산했을 때 0이 아니면 기술을 보유한 것.

=========================================
GROUP_CONCAT(column_name)
→ 그룹화된 행들을 하나의 문자열로 합치는 함수입니다.

NAME, '|', CATEGORY
→ NAME과 CATEGORY 컬럼을 '|' 기호로 연결하여 하나의 문자열로 만듭니다.

SEPARATOR '|'
→ 여러 개의 그룹화된 데이터(각 행들)를 '|' 기호로 구분하여 하나의 문자열로 만듭니다.
=========================================


With cte as (
    select 
        d.ID, 
        d.EMAIL,
        GROUP_CONCAT(NAME, '|', CATEGORY SEPARATOR '|') as SKILL
    from DEVELOPERS d
    join SKILLCODES s on d.SKILL_CODE & s.CODE
    group by d.ID, d.EMAIL
)
SELECT * 
FROM (
    SELECT 
        CASE 
            WHEN (SKILL LIKE '%Front End%' AND SKILL LIKE '%Python%') THEN 'A'
            WHEN (SKILL LIKE '%C#%') THEN 'B'
            WHEN (SKILL LIKE '%Front End%') THEN 'C'
        END AS GRADE,
        ID,
        EMAIL
    FROM cte
) AS subquery
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID;

