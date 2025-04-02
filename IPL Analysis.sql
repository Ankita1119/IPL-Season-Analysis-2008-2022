
SELECT* FROM ipl_matches;
SELECT * FROM ipl_ball_by_ball;


-- 1. Season Winners
SELECT season, winning_team AS champion
FROM ipl_matches
WHERE match_number = 'Final'
ORDER BY season ASC;

-- 2. Top Run-Scorers Season wise  (Orange Cap)
WITH season_wise_runs AS
(
    SELECT season, 
	       batter, SUM(batsman_run) AS total_runs,
           RANK() OVER (PARTITION BY season ORDER BY SUM(batsman_run) DESC) AS rnk
    FROM ipl_ball_by_ball b
    JOIN ipl_matches m ON b.id = m.id
    GROUP BY season, batter
)
SELECT 
	season, 
	batter, 
	total_runs
FROM season_wise_runs
WHERE rnk = 1
ORDER BY season ASC;

-- Top Run Scorer including all seasons 
SELECT TOP 1
	batter, 
	SUM(batsman_run) AS total_runs
FROM ipl_ball_by_ball
GROUP BY batter
ORDER BY total_runs DESC
;

-- 3. Top Wicket Taker Season wise  (Orange Cap)

WITH season_wise_wickets AS 
(
    SELECT 
	    m.season, b.bowler, 
	   COUNT(b.player_out) AS total_wickets,
       RANK() OVER (PARTITION BY m.season ORDER BY COUNT(b.player_out) DESC) AS rnk
    FROM ipl_ball_by_ball b
    JOIN ipl_matches m 
    ON b.id = m.id
    WHERE b.iswicket_delivery = 1
    GROUP BY m.season,
		     b.bowler
)
SELECT 
	season, 
	bowler, 
	total_wickets
FROM season_wise_wickets
WHERE rnk = 1
ORDER BY season ASC;

-- Top Wicket Taker including all seasons 

SELECT TOP 1
	bowler, 
	COUNT(player_out) AS total_wickets
FROM ipl_ball_by_ball
WHERE iswicket_delivery = 1
GROUP BY bowler
ORDER BY total_wickets DESC;

-- 4. Total Matches Won by Toss Decision combining all seasons

SELECT 
	toss_decision, 
	COUNT(winning_team) AS matches_won
FROM ipl_matches
WHERE toss_winner = winning_team
GROUP BY toss_decision;

-- Total Matches Won by Toss Decision seasons by season
SELECT 
	season,
    SUM(CASE WHEN toss_decision = 'Bat' THEN 1 ELSE 0 END) AS bat_wins,
    SUM(CASE WHEN toss_decision = 'Field' THEN 1 ELSE 0 END) AS field_wins
FROM ipl_matches
WHERE toss_winner = winning_team
GROUP BY season
ORDER BY season ASC;

-- 5.Matches Won by Result Type combining all seasons

SELECT 
	won_by, 
	COUNT(id) AS match_count
FROM ipl_matches
GROUP BY won_by;
 
 -- Matches Won by Result Type seasons by season

SELECT 
	season,
    COUNT(CASE WHEN won_by = 'Runs' THEN id END) AS Runs,
    COUNT(CASE WHEN won_by = 'Wickets' THEN id END) AS Wickets,
    COUNT(CASE WHEN superover = 'Y' THEN id END) AS SuperOver,
    COUNT(CASE WHEN winning_team IS NULL THEN id END) AS NoResults
FROM ipl_matches
GROUP BY season
ORDER BY season;

-- 6. Team Wins by Venue combining all seasons

SELECT 
    venue,
    SUM(CASE WHEN won_by = 'Runs' THEN 1 ELSE 0 END) AS wins_by_runs,
    SUM(CASE WHEN won_by = 'Wickets' THEN 1 ELSE 0 END) AS wins_by_wickets,
    SUM(CASE WHEN superover = 'Yes' THEN 1 ELSE 0 END) AS wins_in_superover,
    SUM(CASE WHEN won_by = 'No Result' THEN 1 ELSE 0 END) AS no_result_matches
FROM ipl_matches
GROUP BY venue
ORDER BY venue;

-- 7. Total Wins by team season by season
SELECT 
    season,
    winning_team AS team,
    COUNT(*) AS total_wins
FROM 
    ipl_matches
GROUP BY 
    season, winning_team
ORDER BY 
    season , total_wins DESC;

-- Total Wins by team combining all season 

SELECT 
    winning_team AS team,
    COUNT(*) AS total_wins_overall
FROM 
    ipl_matches
GROUP BY 
    winning_team
ORDER BY 
    total_wins_overall DESC;