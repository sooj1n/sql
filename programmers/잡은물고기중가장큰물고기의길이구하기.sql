-- 가장 큰 물고기의 길이를 'cm' 를 붙여 출력
-- CONCAT(문자열1, 문자열2)

SELECT CONCAT(MAX(LENGTH), 'cm') AS MAX_LENGTH
FROM FISH_INFO;

