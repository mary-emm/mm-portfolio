-- 01_turnout_context.sql
-- Purpose: average Johor DUN turnout, SE-13 to SE-16 (context plot)
-- Run in: electiondata.my Query Builder
-- Note: unweighted mean of seat turnouts, not state turnout

SELECT election, date, COUNT(*) AS n_seats,
       ROUND(AVG(voter_turnout), 1) AS avg_turnout
FROM headline_stats
WHERE state = 'Johor'
  AND election IN ('SE-13', 'SE-14', 'SE-15', 'SE-16')
GROUP BY election, date
ORDER BY date