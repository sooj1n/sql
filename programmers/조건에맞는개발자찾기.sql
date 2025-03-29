# SKILLCODES : 프로그래밍 언어에 대한 정보
# DEVELOPERS : 개발자의 스킬 정보
# 400 (=b'110010000') 스킬을 가진 개발자는 
# 256 (=b'100000000') + 128 (=b'10000000'), 16 (=b'10000')  스킬 보유

# SKILL_CODE & X의 결과가 0이 아니면 해당 기술이 포함됨.

'''
10 (2) & 110 (6) = 10 (2) → ✅ Python 포함 (ID 1)
100 (4) & 110 (6) = 100 (4) → ✅ C# 포함 (ID 2)
110 (6) & 110 (6) = 110 (6) → ✅ Python + C# 포함 (ID 3)
1000 (8) & 110 (6) = 0000 (0) → ❌ Java만 포함 (ID 4 제외)


AND 논리연산
0 0 0
0 1 0
1 0 0
1 1 1 
'''

SELECT 
    ID
    , EMAIL
    , FIRST_NAME
    , LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (
                    SELECT SUM(CODE)
                    FROM SKILLCODES
                    WHERE NAME IN ('Python', 'C#'))
ORDER BY ID

