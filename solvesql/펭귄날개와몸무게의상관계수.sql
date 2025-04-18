펭귄은 일반적으로 날개 길이가 길 수록 큰 펭귄이기 때문에 몸무게도 늘어납니다. 따라서 날개 길이와 몸무게 사이에는 양의 상관 관계가 있습니다. 다만, 펭귄 종에 따라 상관 관계의 정도가 다릅니다. 이를 확인하기 위해 날개 길이와 몸무게의 피어슨 상관 계수(Pearson Correlation Coefficient)를 구하는 쿼리를 작성해주세요.

쿼리 결과에는 아래 컬럼이 포함되어 있어야 하고, 상관 계수는 소수점 아래 넷째 자리에서 반올림 해 셋째 자리까지 출력되어야 합니다.

species: 펭귄 종
corr: 날개 길이와 몸무게의 상관 계수

==========================================================
-- POWER( column_name, exponent ) 제곱
-- SQRT( column_name ) 루트

-- 평균
WITH
  calc_avg AS (
    SELECT
      species,
      flipper_length_mm,
      avg(flipper_length_mm) OVER (PARTITION BY species) avg_fl,
      body_mass_g,
      avg(body_mass_g) OVER (PARTITION BY species) avg_bm
    FROM penguins
  )
-- 관측값과 평균의 차를 구해서 상관계수 corr 구하기
SELECT
  species,
  round(
    sum( (flipper_length_mm - avg_fl) * (body_mass_g - avg_bm))
    / sqrt( sum( power(flipper_length_mm - avg_fl, 2)))
    / sqrt( sum( power(body_mass_g - avg_bm, 2)))
  , 3) corr
FROM calc_avg
GROUP BY species;

