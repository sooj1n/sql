SELECT 
  a.name AS athlete_name
FROM 
  records r
  JOIN games g ON r.game_id = g.id
  JOIN athletes a ON r.athlete_id = a.id
WHERE 
  g.year >= 2000
  AND r.medal IS NOT NULL
GROUP BY 
  a.id, a.name
HAVING 
  COUNT(DISTINCT r.team_id) >= 2
ORDER BY 
  athlete_name ASC;
