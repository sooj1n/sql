-- MoMA에 등록된 작가 ( artist 테이블 )
-- 전시된 작품이 없는 작가 (artwork_artists의 artist_id에 없는 작가)
-- 조건: 사망 artists - death_year null이 아닌 행
SELECT DISTINCT
  *
from
  artists
  left outer join artworks_artists on artists.artist_id = artworks_artists.artist_id
where
  artworks_artists.artist_id IS NULL
  and artists.death_year IS NOT NULL
