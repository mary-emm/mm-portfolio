SELECT s.election, s.seat,
       s.voters_total,
       s.ballots_issued,
       d.ethnic_malay, d.ethnic_chinese, d.ethnic_indian,
       d.votertype_early
      
  
FROM headline_stats s
JOIN voter_demographics d
  ON s.date = d.date AND s.election = d.election
 AND s.state = d.state AND s.seat = d.seat
WHERE s.state = 'Johor' AND s.election = 'SE-15'
ORDER BY s.seat