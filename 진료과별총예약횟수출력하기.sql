-- 2022년 5월에 예약한 환자 수를 진료과코드 별로 조회
-- 정렬 : 예약한 환자 수 > 진료과 코드

SELECT MCDP_CD as 진료과코드 ,COUNT(PT_NO) as 5월예약건수
FROM APPOINTMENT
WHERE YEAR(APNT_YMD)=2022 and MONTH(APNT_YMD)=5
GROUP BY MCDP_CD
ORDER BY COUNT(PT_NO), MCDP_CD
