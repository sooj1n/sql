-- ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요. 이때 결과는 아이디 순으로 조회해야 합니다

## 날짜 형식 변경  DATE_FORMAT()

SELECT
    ANIMAL_ID,
    NAME,
    DATE_FORMAT(DATETIME,'%Y-%m-%d') as '날짜'
FROM ANIMAL_INS
Order by ANIMAL_ID
