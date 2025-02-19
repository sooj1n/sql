-- 동물의 이름은 몇 개
-- 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나

----------------------------------
- 중복을 제거한 후 개수를 센다.
- name이 중복된 경우 한 번만 카운트됨.
---------------------------------
SELECT
    COUNT(DISTINCT name) cnts
FROM
    animal_ins
WHERE
    name IS NOT NULL;


=====================================================
----------------------------------
- COUNT(name)을 먼저 수행하여 전체 name 개수를 구한 후,
- DISTINCT를 적용하여 중복을 제거한 결과를 반환.
- 하지만, COUNT(name)은 전체 개수를 반환하는 단일 값이므로 DISTINCT는 의미가 없음.

-----------------------------------
SELECT DISTINCT
    COUNT(name) cnts
FROM
    animal_ins
WHERE
    name IS NOT NULL;

