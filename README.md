# 🏏 IPL SEASON ANALYSIS (2008-2022)

![Image](https://github.com/user-attachments/assets/db5b41e5-9bf4-44ad-806e-164b8d5fd6d2)

## 📌 Project Overview

**This project provides a comprehensive analysis of IPL seasons from 2008 to 2022, leveraging SQL and Power BI. The dashboard presents detailed insights into match outcomes, team performances, individual player achievements, and key tournament statistics.**

## 🔗 View the Power BI Dashboard  
📊 **Check out the Interactive Dashboard here:**  
[🔗 Click to Open Power BI Dashboard](https://github.com/Ankita1119/IPL-Season-Analysis-2008-2022/raw/main/IPL%20Analysis.pbix)  

### 📌 Dashboard Preview  
Here’s a preview of the Power BI dashboard:  

![IPL Power BI Dashboard]()  
*(This is a static preview; click the link above to explore the interactive version.)* 

## 🎯 Key Highlights

✅ Season-wise Champion Teams 🏆  
✅ Orange & Purple Cap Holders 🏅  
✅ Total Sixes & Fours in Each Season 🔥  
✅ Player & Bowler Stats 🎯  
✅ Matches Won by Venue, Toss Decision & Result Type 📊  
✅ Team-wise Win Count in Each Season ⚡ 

## 📂 Dataset & Schema

This project utilizes two tables:
#### 1️⃣ ipl_matches_2008_2022
**Contains match-level details from 2008 to 2022.**

```sql
CREATE TABLE ipl_matches_2008_2022 (
    id INT8 PRIMARY KEY,
    city VARCHAR(50),
    match_date DATE,
    season VARCHAR(50),
    match_number VARCHAR(50),
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    venue VARCHAR(100),
    toss_winner VARCHAR(50),
    toss_decision VARCHAR(50),
    superover VARCHAR(50),
    winning_team VARCHAR(50),
    won_by VARCHAR(50),
    margin VARCHAR(50),
    method VARCHAR(50),
    player_of_match VARCHAR(50),
    umpire1 VARCHAR(50),
    umpire2 VARCHAR(50)
);
```



#### 2️⃣ ipl_ball_by_ball_2008_2022
**Contains ball-by-ball details of every IPL match played.**
```sql
CREATE TABLE ipl_ball_by_ball_2008_2022 (
    id INT8 NOT NULL,
    innings INT8,
    overs INT8,
    ball_number INT8,
    batter VARCHAR(50),
    bowler VARCHAR(50),
    non_striker VARCHAR(50),
    extra_type VARCHAR(50),
    batsman_run INT8,
    extras_run INT8,
    total_run INT8,
    non_boundry INT8,
    iswicket_delivery INT8,
    player_out VARCHAR(50),
    dismisal_kind VARCHAR(50),
    fielders_involved VARCHAR(50),
    batting_team VARCHAR(50)
);
```
## 📊 Power BI Dashboard Insights

📢 **Note:** This Power BI dashboard is **dynamic**, meaning users can explore data across different seasons. However, the results currently displayed in my analysis reflect the **latest season available in the dataset (2022).**  

🔹 Season Winners & Individual Awards

- Displays the title-winning team each season.

- Shows the Orange Cap (most runs) & Purple Cap (most wickets) holders.

- Highlights the total fours & sixes in each season.

![Image](https://github.com/user-attachments/assets/f5762279-44a4-4bde-aef6-6cdddda6ecd2)

🔹 Batting & Bowling Stats

- Select a batsman to view total runs, sixes, fours, and strike rate.

- Select a bowler to view total wickets, economy rate, and bowling average.

![Image](https://github.com/user-attachments/assets/94398320-65b3-43a7-8c8d-4a9569723835)

🔹 Team & Match Analysis

- Matches Won by Venue (Runs/Wickets)

- Total Wins by a Team in a Season

![Image](https://github.com/user-attachments/assets/1b13498b-f669-49ef-8c89-552740c6d48a)

- Matches Won by Toss Decision (Field/Bat)

- Matches Won by Result Type (Runs/Wickets)

![Image](https://github.com/user-attachments/assets/db1b068d-9825-44f7-b597-99c9c80816f1)

## 📌 SQL Queries for Power BI Dashboard

### 🏆 1. Season Winners

```sql
SELECT 
	season, winning_team AS champion
FROM ipl_matches
WHERE match_number = 'Final'
ORDER BY season ASC;
```
### 🔥 2. Top Run-Scorers (Orange Cap) (SQL Query with Solution)

```sql
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
```
### ❓ 3. Top Wicket-Takers (Purple Cap)

### ❓ 4. Matches Won by Toss Decision

### ❓ 5. Matches Won by Result Type

### ❓ 6. Matches Won by Venue

### ❓ 7. Total matches won by Team in Season 

## 🚀 Project Goals & Impact

📌 Enhanced IPL Data Analysis using SQL & Power BI.

📌 Interactive Power BI Dashboard to explore insights quickly.

📌 Historical Trends in IPL seasons for teams & players.

## 🎯 Future Enhancements:

Player-wise performance tracking for each season.

Predictive analytics for upcoming IPL seasons.

Integration with live IPL match data.





















