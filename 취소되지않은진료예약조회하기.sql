-- 환자 정보를 담은 PATIENT
-- 의사 정보를 담은 DOCTOR
-- 진료 예약목록을 담은 APPOINTMENT
-- 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성해주세요. 
-- 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시

SELECT 
    APNT_NO,
    PT_NAME,
    p.PT_NO,
    a.MCDP_CD,
    DR_NAME,
    APNT_YMD
from APPOINTMENT a
join PATIENT p on a.PT_NO=p.PT_NO
join DOCTOR d on a.MDDR_ID=d.DR_ID
where (DATE_FORMAT(APNT_YMD,'%Y-%m-%d')='2022-04-13') and APNT_CNCL_YN='N' and a.MCDP_CD='CS'
order by APNT_YMD
