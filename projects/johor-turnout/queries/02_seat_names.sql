-- 02_seat_names.sql
-- Purpose: list Johor seats present in only one of SE-15 and SE-16.

SELECT a.seat AS seat_se15, b.seat AS seat_se16
FROM (SELECT seat FROM headline_stats
      WHERE state = 'Johor' AND election = 'SE-15') a
FULL OUTER JOIN (SELECT seat FROM headline_stats
                 WHERE state = 'Johor' AND election = 'SE-16') b
  ON a.seat = b.seat
WHERE a.seat IS NULL OR b.seat IS NULL