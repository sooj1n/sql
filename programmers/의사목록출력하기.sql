-- 흉부(CS) Or 일반(GS)
-- 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬

-- DATE_FORMAT(HIRE_YMD,'%Y-%m-%d')

SELECT 
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD,'%Y-%m-%d') as HIRE_YMD
FROM 
    DOCTOR
WHERE MCDP_CD='CS' or MCDP_CD='GS'
ORDER BY HIRE_YMD DESC, DR_NAME ASC
